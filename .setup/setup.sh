#!/bin/sh

ROOT_DIR="$(cd "$(dirname "$0")" || exit 1; pwd)"

"$ROOT_DIR/configure-git.sh"
"$ROOT_DIR/configure-vim.sh"

