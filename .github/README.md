# Release automation

`workflows/powerwriter_at_python.yml` builds the C library and the standalone
Python executables on Windows, Linux, and macOS. When a GitHub Release is
published, the release job:

1. Packages each platform artifact as `powerwriter-at-<platform>.zip`.
2. Uploads the ZIP files to the GitHub Release.
3. Mirrors the release metadata and ZIP files to Gitee.

## Gitee setup

Create a Gitee personal access token with repository (`projects`) permission,
then add it to the GitHub repository as the Actions secret `GITEE_TOKEN`:

```text
GitHub repository -> Settings -> Secrets and variables -> Actions
Name: GITEE_TOKEN
```

The workflow targets `openpowerwriter/PowerWriter_AT_Command` by default. The
Gitee release uses the same tag, name, description, and prerelease flag as the
GitHub release. If the tag does not exist on Gitee, it is created from `main`
(the target can be changed through `GITEE_TARGET_COMMITISH`).

If `GITEE_TOKEN` is not configured, the Gitee step logs a warning and skips the
mirror; the GitHub Release is still published normally.

Gitee Go only provides Linux build images, so Windows and macOS binaries are
built on GitHub and then mirrored to Gitee. Native Gitee Go release jobs are not
used for those platforms.

## Repair an existing release

`workflows/sync_release_assets.yml` can rebuild the platform ZIPs from an
existing Actions run and upload them to a GitHub Release. It also mirrors the
result to Gitee. Run it manually with:

- `tag`: release tag, for example `V1.0.0`
- `run_id`: optional Actions run ID containing the three
  `powerwriter-at-*` artifacts

Leave `run_id` empty to mirror ZIP files that are already attached to the
GitHub Release.
