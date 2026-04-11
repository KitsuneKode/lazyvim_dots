#!/usr/bin/env sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
src="$repo_dir/nvim-minimal"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
dst="$config_home/nvim-minimal"

if [ ! -d "$src" ]; then
  echo "nvim-minimal profile not found at: $src" >&2
  exit 1
fi

mkdir -p "$config_home"

if [ -L "$dst" ]; then
  current=$(readlink "$dst")
  if [ "$current" = "$src" ]; then
    echo "nvim-minimal is already linked: $dst -> $src"
    exit 0
  fi

  backup="$dst.backup.$(date +%Y%m%d%H%M%S)"
  mv "$dst" "$backup"
  echo "Moved existing symlink to: $backup"
elif [ -e "$dst" ]; then
  echo "Refusing to replace existing path: $dst" >&2
  echo "Move it away, then run this installer again." >&2
  exit 1
fi

ln -s "$src" "$dst"

cat <<EOF
Installed nvim-minimal:
  $dst -> $src

Launch with:
  NVIM_APPNAME=nvim-minimal nvim

Optional alias:
  alias snvim='NVIM_APPNAME=nvim-minimal nvim'
EOF
