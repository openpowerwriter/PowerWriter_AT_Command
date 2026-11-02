#!/usr/bin/env python3
"""Mirror a GitHub release and its assets to Gitee.

Gitee Go only provides Linux build images, so Windows and macOS binaries are
built on GitHub. This script copies the published release metadata and the
platform ZIP files to the matching Gitee release.

The Gitee access token is read from GITEE_TOKEN. When the token is not set the
script exits successfully and leaves the GitHub release unchanged, so a fork or
a repository without Gitee credentials can still publish GitHub releases.
"""

from __future__ import annotations

import argparse
import glob
import json
import os
import sys
import urllib.error
import urllib.parse
import urllib.request
import uuid
from pathlib import Path
from typing import Optional

DEFAULT_API = "https://gitee.com/api/v5"
DEFAULT_OWNER = "openpowerwriter"
DEFAULT_REPO = "PowerWriter_AT_Command"
REQUEST_TIMEOUT = 300


class GiteeError(RuntimeError):
    """A Gitee API call failed."""

    def __init__(self, message: str, status: Optional[int] = None) -> None:
        super().__init__(message)
        self.status = status


def log(message: str) -> None:
    print(message, flush=True)


def _safe_url(url: str) -> str:
    """Return a URL without its query string so tokens never reach the log."""
    parts = urllib.parse.urlsplit(url)
    return urllib.parse.urlunsplit(
        (parts.scheme, parts.netloc, parts.path, "", "")
    )


def _http(
    method: str,
    url: str,
    data: Optional[bytes] = None,
    headers: Optional[dict[str, str]] = None,
) -> tuple[int, bytes]:
    request_headers = {
        "User-Agent": "PowerWriter-Release-Sync",
        "Accept": "application/json",
    }
    request_headers.update(headers or {})
    request = urllib.request.Request(
        url, data=data, headers=request_headers, method=method
    )
    try:
        with urllib.request.urlopen(request, timeout=REQUEST_TIMEOUT) as response:
            return response.status, response.read()
    except urllib.error.HTTPError as exc:
        body = exc.read()
        text = body[:2000].decode("utf-8", "replace")
        raise GiteeError(
            "%s %s failed: HTTP %d: %s"
            % (method, _safe_url(url), exc.code, text),
            exc.code,
        ) from None


def _json(body: bytes, context: str):
    if not body:
        return None
    try:
        return json.loads(body.decode("utf-8"))
    except ValueError:
        raise GiteeError("%s: invalid JSON response" % context) from None


def _repository_url(api: str, owner: str, repo: str) -> str:
    return "%s/repos/%s/%s" % (
        api.rstrip("/"),
        urllib.parse.quote(owner, safe=""),
        urllib.parse.quote(repo, safe=""),
    )


def _get_json(url: str, token: str, context: str):
    separator = "&" if "?" in url else "?"
    full_url = url + separator + urllib.parse.urlencode({"access_token": token})
    status, body = _http("GET", full_url, headers={"Accept": "application/json"})
    return _json(body, context)


def _form_json(
    method: str, url: str, token: str, fields: dict[str, str], context: str
):
    data = dict(fields)
    data["access_token"] = token
    encoded = urllib.parse.urlencode(data).encode("utf-8")
    status, body = _http(
        method,
        url,
        encoded,
        {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
    )
    return _json(body, context)


def _multipart_body(fields: dict[str, str], file_path: Path):
    boundary = "----PowerWriterAT" + uuid.uuid4().hex
    chunks = []
    for name, value in fields.items():
        chunks.append(("--%s\r\n" % boundary).encode("utf-8"))
        chunks.append(
            ('Content-Disposition: form-data; name="%s"\r\n\r\n' % name).encode(
                "utf-8"
            )
        )
        chunks.append(str(value).encode("utf-8"))
        chunks.append(b"\r\n")
    chunks.append(("--%s\r\n" % boundary).encode("utf-8"))
    chunks.append(
        (
            'Content-Disposition: form-data; name="file"; filename="%s"\r\n'
            % file_path.name
        ).encode("utf-8")
    )
    chunks.append(b"Content-Type: application/octet-stream\r\n\r\n")
    chunks.append(file_path.read_bytes())
    chunks.append(b"\r\n")
    chunks.append(("--%s--\r\n" % boundary).encode("utf-8"))
    return b"".join(chunks), boundary


def _get_release(api: str, owner: str, repo: str, tag: str, token: str):
    url = "%s/releases/tags/%s" % (
        _repository_url(api, owner, repo),
        urllib.parse.quote(tag, safe=""),
    )
    try:
        return _get_json(url, token, "get release")
    except GiteeError as exc:
        if exc.status == 404:
            return None
        raise


def _list_assets(
    api: str, owner: str, repo: str, release_id: int, token: str
) -> list[dict]:
    base = "%s/releases/%d/attach_files" % (
        _repository_url(api, owner, repo),
        release_id,
    )
    assets = []
    page = 1
    while True:
        url = "%s?per_page=100&page=%d" % (base, page)
        items = _get_json(url, token, "list release assets") or []
        assets.extend(items)
        if len(items) < 100:
            return assets
        page += 1


def _delete_asset(
    api: str,
    owner: str,
    repo: str,
    release_id: int,
    asset_id: int,
    token: str,
) -> None:
    url = "%s/releases/%d/attach_files/%d" % (
        _repository_url(api, owner, repo),
        release_id,
        asset_id,
    )
    separator = "&" if "?" in url else "?"
    full_url = url + separator + urllib.parse.urlencode({"access_token": token})
    _http("DELETE", full_url, headers={"Accept": "application/json"})


def _upload_asset(
    api: str,
    owner: str,
    repo: str,
    release_id: int,
    file_path: Path,
    token: str,
) -> dict:
    body, boundary = _multipart_body({"access_token": token}, file_path)
    url = "%s/releases/%d/attach_files" % (
        _repository_url(api, owner, repo),
        release_id,
    )
    status, response = _http(
        "POST",
        url,
        body,
        {
            "Accept": "application/json",
            "Content-Type": "multipart/form-data; boundary=%s" % boundary,
        },
    )
    result = _json(response, "upload release asset")
    if not isinstance(result, dict):
        raise GiteeError("upload release asset: unexpected response")
    return result


def _release_fields(
    tag: str, name: str, body: str, prerelease: bool
) -> dict[str, str]:
    return {
        "tag_name": tag,
        "name": name,
        "body": body,
        "prerelease": "true" if prerelease else "false",
    }


def _load_event(path: Optional[str]) -> dict:
    if not path:
        return {}
    try:
        with open(path, "r", encoding="utf-8") as handle:
            return json.load(handle)
    except (OSError, ValueError) as exc:
        raise SystemExit("cannot read event payload %s: %s" % (path, exc))


def _asset_files(patterns: list[str]) -> list[Path]:
    files: list[Path] = []
    seen: set[str] = set()
    for pattern in patterns:
        for match in glob.glob(pattern):
            path = Path(match)
            if not path.is_file():
                continue
            key = str(path.resolve())
            if key in seen:
                continue
            seen.add(key)
            files.append(path)
    return files


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Mirror a GitHub release and its assets to Gitee."
    )
    parser.add_argument(
        "--event",
        default=os.environ.get("GITHUB_EVENT_PATH"),
        help="GitHub event JSON path (default: GITHUB_EVENT_PATH)",
    )
    parser.add_argument("--tag", help="release tag (default: from the event)")
    parser.add_argument("--name", help="release name (default: from the event)")
    parser.add_argument("--body", help="release description (default: from the event)")
    parser.add_argument(
        "--prerelease",
        choices=("true", "false"),
        help="override the prerelease flag",
    )
    parser.add_argument(
        "--target",
        default=os.environ.get("GITEE_TARGET_COMMITISH", "main"),
        help="Gitee target branch or commit for a new tag (default: main)",
    )
    parser.add_argument(
        "--assets",
        nargs="*",
        default=["artifacts/*.zip"],
        help="asset file patterns (default: artifacts/*.zip)",
    )
    parser.add_argument(
        "--api",
        default=os.environ.get("GITEE_API", DEFAULT_API),
        help="Gitee API base URL",
    )
    parser.add_argument(
        "--owner",
        default=os.environ.get("GITEE_OWNER", DEFAULT_OWNER),
        help="Gitee repository owner",
    )
    parser.add_argument(
        "--repo",
        default=os.environ.get("GITEE_REPO", DEFAULT_REPO),
        help="Gitee repository name",
    )
    parser.add_argument(
        "--token",
        default=os.environ.get("GITEE_TOKEN", ""),
        help="Gitee access token (default: GITEE_TOKEN)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="print the planned operations without calling Gitee",
    )
    args = parser.parse_args()

    if not args.token:
        log("GITEE_TOKEN is not set; skipping Gitee release sync.")
        return 0

    event = _load_event(args.event)
    release = event.get("release")
    if not isinstance(release, dict):
        # `gh api repos/.../releases/tags/<tag>` returns the release object
        # directly, while a GitHub release event wraps it in "release".
        release = event
    tag = args.tag or release.get("tag_name")
    if not tag:
        parser.error("--tag is required when the event has no release tag")
    name = args.name or release.get("name") or tag
    body = args.body
    if body is None:
        body = release.get("body") or ""
    if args.prerelease is not None:
        prerelease = args.prerelease == "true"
    else:
        prerelease = bool(release.get("prerelease", False))

    assets = _asset_files(args.assets)
    if not assets:
        log("No release assets matched; the Gitee release will have no binaries.")

    if args.dry_run:
        log(
            "Would sync release %s to Gitee %s/%s with %d asset(s)."
            % (tag, args.owner, args.repo, len(assets))
        )
        for path in assets:
            log("  asset: %s (%d bytes)" % (path.name, path.stat().st_size))
        return 0

    api = args.api
    token = args.token
    owner = args.owner
    repo = args.repo
    try:
        existing = _get_release(api, owner, repo, tag, token)
        fields = _release_fields(tag, name, body, prerelease)
        if existing:
            release_id = int(existing["id"])
            update_fields = dict(fields)
            update_fields.pop("target_commitish", None)
            _form_json(
                "PATCH",
                "%s/releases/%d" % (_repository_url(api, owner, repo), release_id),
                token,
                update_fields,
                "update release",
            )
            log("Updated Gitee release %s (id=%d)." % (tag, release_id))
        else:
            create_fields = dict(fields)
            create_fields["target_commitish"] = args.target
            created = _form_json(
                "POST",
                "%s/releases" % _repository_url(api, owner, repo),
                token,
                create_fields,
                "create release",
            )
            if not created or "id" not in created:
                raise GiteeError("create release: response has no id")
            release_id = int(created["id"])
            log("Created Gitee release %s (id=%d)." % (tag, release_id))

        current = {item.get("name"): item for item in _list_assets(
            api, owner, repo, release_id, token
        )}
        for path in assets:
            old = current.get(path.name)
            if old and old.get("id") is not None:
                _delete_asset(
                    api, owner, repo, release_id, int(old["id"]), token
                )
                log("Replaced existing Gitee asset %s." % path.name)
            uploaded = _upload_asset(
                api, owner, repo, release_id, path, token
            )
            log(
                "Uploaded %s (%d bytes) to Gitee release %s."
                % (path.name, path.stat().st_size, tag)
            )
            if uploaded.get("browser_download_url"):
                log("  %s" % uploaded["browser_download_url"])
    except GiteeError as exc:
        log("ERROR: %s" % exc)
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
