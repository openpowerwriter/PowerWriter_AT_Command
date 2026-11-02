#!/usr/bin/env bash
# Build the PowerWriter AT C bridge library for macOS.
set -euo pipefail
cd "$(dirname "$0")"

JOBS="$(sysctl -n hw.ncpu 2>/dev/null || echo 4)"
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release -j"$JOBS"

echo "[OK] Library output: $(pwd)/lib/macos/"
