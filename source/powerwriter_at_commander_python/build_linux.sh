#!/usr/bin/env bash
# Build the PowerWriter AT C bridge library for Linux.
set -euo pipefail
cd "$(dirname "$0")"

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release -j"$(nproc 2>/dev/null || echo 4)"

echo "[OK] Library output: $(pwd)/lib/linux/"
