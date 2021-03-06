#!/usr/bin/env sh

app_dir="$HOME/.config/spf13-vim-master"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

rm $HOME/.vimrc
rm $HOME/.vimrc.bundles
rm $HOME/.vimrc.local
rm $HOME/.vimrc.before
rm $HOME/.viminfo

rm -rf $HOME/.vim
rm -rf $app_dir
