#!/usr/bin/env sh

app_dir="$HOME/.config/vimc"

warn() {
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

rm $HOME/.vim
rm $HOME/.config/nvim

rm -rf $app_dir
