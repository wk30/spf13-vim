" Modeline and Notes {
" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"                    __ _ _____              _
"         ___ _ __  / _/ |___ /      __   __(_)_ __ ___
"        / __| '_ \| |_| | |_ \ _____\ \ / /| | '_ ` _ \
"        \__ \ |_) |  _| |___) |_____|\ V / | | | | | | |
"        |___/ .__/|_| |_|____/        \_/  |_|_| |_| |_|
"            |_|
"
"   This is the personal .vimrc.bundles file of Steve Francia.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
"
"   This file imports the various plugins of spf13. If you
"   wish to alter which groups are imported, see vimrc.before.
"   If you wish to add or remove individual bundles, create
"   ~/.vimrc.bundles.local and `Bundle` or `UnBundle` as needed
"   from there.
"
"   You can find me at http://spf13.com
" }

" Environment {

  " Basics {
    set nocompatible        " Must be first line
    set background=dark     " Assume a dark background
  " }

  " " Setup Bundle Support {
  "     " The next three lines ensure that the ~/.vim/bundle/ system works
  "     filetype off
  "     set rtp+=~/.vim/bundle/vundle
  "     call vundle#rc()
  " " }

  " " Add an UnBundle command {
  " function! UnBundle(arg, ...)
  "   let bundle = vundle#config#init_bundle(a:arg, a:000)
  "   call filter(g:vundle#bundles, 'v:val["name_spec"] != "' . a:arg . '"')
  " endfunction

  " com! -nargs=+         UnBundle
  " \ call UnBundle(<args>)
  " " }

  if !exists('g:spf13_home')
    let g:spf13_home=expand('~/.config/vimc', ':p')
  endif
  if !exists('g:spf13_bundle_path')
    let g:spf13_bundle_path=g:spf13_home.'/.vim/plugged'
  endif
" }

" Vim-Plug {
  " Specify a directory for plugins
  " - For Neovim: stdpath('data') . '/plugged'
  " - Avoid using standard Vim directory names like 'plugin'
  call plug#begin(g:spf13_bundle_path)

  " Deps {
    " Plug 'gmarik/vundle'
    Plug 'marcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    if executable('ag')
      Plug 'mileszs/ack.vim'
      let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
    elseif executable('ack-grep')
      let g:ackprg="ack-grep -H --nocolor --nogroup --column"
      Plug 'mileszs/ack.vim'
    elseif executable('ack')
      Plug 'mileszs/ack.vim'
    endif
  " }

  " In your .vimrc.before.local file
  " list only the plugin groups you will use
  if !exists('g:spf13_bundle_groups')
    let g:spf13_bundle_groups=['general', 'writing', 'neocomplete', 'programming', 'php', 'ruby', 'python', 'go', 'misc',]
  endif

  " To override all the included bundles, add the following to your
  " .vimrc.bundles.local file:
  "   let g:override_spf13_bundles = 1
  if !exists("g:override_spf13_bundles")

  " General {
    if count(g:spf13_bundle_groups, 'general')
      Plug 'scrooloose/nerdtree'
      Plug 'altercation/vim-colors-solarized'
      Plug 'spf13/vim-colors'
      Plug 'tpope/vim-surround'
      Plug 'tpope/vim-repeat'
      Plug 'rhysd/conflict-marker.vim'
      Plug 'jiangmiao/auto-pairs'
      Plug 'ctrlpvim/ctrlp.vim'
      Plug 'tacahiroy/ctrlp-funky'
      Plug 'terryma/vim-multiple-cursors'
      Plug 'vim-scripts/sessionman.vim'
      Plug 'vim-scripts/matchit.zip'
      if (has("python") || has("python3")) && exists('g:spf13_use_powerline') && !exists('g:spf13_use_old_powerline')
        Plug 'lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
      elseif exists('g:spf13_use_powerline') && exists('g:spf13_use_old_powerline')
        Plug 'lokaltog/vim-powerline'
      else
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
      endif
      Plug 'powerline/fonts'
      Plug 'bling/vim-bufferline'
      Plug 'easymotion/vim-easymotion'
      Plug 'jistr/vim-nerdtree-tabs'
      Plug 'flazz/vim-colorschemes'
      Plug 'mbbill/undotree'
      Plug 'nathanaelkane/vim-indent-guides'
      if !exists('g:spf13_no_views')
        Plug 'vim-scripts/restore_view.vim'
      endif
      Plug 'mhinz/vim-signify'
      Plug 'tpope/tpope-vim-abolish'
      Plug 'osyo-manga/vim-over'
      Plug 'kana/vim-textobj-user'
      Plug 'kana/vim-textobj-indent'
      Plug 'gcmt/wildfire.vim'
      " Plug 'liuchengxu/vim-which-key'
    endif
  " }

  " Writing {
    if count(g:spf13_bundle_groups, 'writing')
      Plug 'reedes/vim-litecorrect'
      Plug 'reedes/vim-textobj-sentence'
      Plug 'reedes/vim-textobj-quote'
      Plug 'reedes/vim-wordy'
    endif
  " }

  " General Programming {
    if count(g:spf13_bundle_groups, 'programming')
      " Pick one of the checksyntax, jslint, or syntastic
      Plug 'scrooloose/syntastic'
      Plug 'tpope/vim-fugitive'
      Plug 'mattn/webapi-vim'
      Plug 'mattn/gist-vim'
      Plug 'scrooloose/nerdcommenter'
      Plug 'tpope/vim-commentary'
      Plug 'godlygeek/tabular'
      Plug 'luochen1990/rainbow'
      if executable('ctags')
        " Plug 'vim-scripts/taglist.vim'
        Plug 'majutsushi/tagbar'
      endif
      Plug 'editorconfig/editorconfig-vim'
    endif
  " }

  " Snippets & AutoComplete {
    if count(g:spf13_bundle_groups, 'snipmate')
      Plug 'garbas/vim-snipmate'
      Plug 'honza/vim-snippets'
      " Source support_function.vim to support vim-snippets.
      if filereadable(expand(g:spf13_bundle_path."/vim-snippets/snippets/support_functions.vim"))
        source g:spf13_bundle_path."/vim-snippets/snippets/support_functions.vim"
      endif
    elseif count(g:spf13_bundle_groups, 'youcompleteme')
      Plug 'valloric/YouCompleteMe'
      Plug 'sirVer/ultisnips'
      Plug 'honza/vim-snippets'
    elseif count(g:spf13_bundle_groups, 'neocomplcache')
      Plug 'shougo/neocomplcache'
      Plug 'shougo/neosnippet'
      Plug 'shougo/neosnippet-snippets'
      Plug 'honza/vim-snippets'
    elseif count(g:spf13_bundle_groups, 'neocomplete')
      Plug 'shougo/neocomplete.vim'
      Plug 'shougo/neosnippet'
      Plug 'shougo/neosnippet-snippets'
      Plug 'honza/vim-snippets'
    endif
  " }

  " PHP {
    if count(g:spf13_bundle_groups, 'php')
      Plug 'spf13/PIV'
      Plug 'stanangeloff/php.vim'
      Plug 'arnaud-lb/vim-php-namespace'
      Plug 'beyondwords/vim-twig'
    endif
  " }

  " Python {
    if count(g:spf13_bundle_groups, 'python')
      " Pick either python-mode or pyflakes & pydoc
      Plug 'klen/python-mode'
      Plug 'yssource/python.vim'
      Plug 'vim-scripts/python_match.vim'
      Plug 'vim-scripts/pythoncomplete'
    endif
  " }

  " Javascript {
    if count(g:spf13_bundle_groups, 'javascript')
      Plug 'elzr/vim-json'
      Plug 'groenewege/vim-less'
      Plug 'pangloss/vim-javascript'
      Plug 'briancollins/vim-jst'
      Plug 'kchmck/vim-coffee-script'
    endif
  " }

  " Scala {
    if count(g:spf13_bundle_groups, 'scala')
      Plug 'derekwyatt/vim-scala'
      Plug 'derekwyatt/vim-sbt'
      Plug 'xptemplate'
    endif
  " }

  " Haskell {
    if count(g:spf13_bundle_groups, 'haskell')
      Plug 'travitch/hasksyn'
      Plug 'dag/vim2hs'
      Plug 'twinside/vim-haskellConceal'
      Plug 'twinside/vim-haskellFold'
      Plug 'lukerandall/haskellmode-vim'
      Plug 'eagletmt/neco-ghc'
      Plug 'eagletmt/ghcmod-vim'
      Plug 'shougo/vimproc.vim'
      Plug 'adinapoli/cumino'
      Plug 'bitc/vim-hdevtools'
    endif
  " }

  " HTML {
    if count(g:spf13_bundle_groups, 'html')
      Plug 'vim-scripts/HTML-AutoCloseTag'
      Plug 'hail2u/vim-css3-syntax'
      Plug 'gorodinskiy/vim-coloresque'
      Plug 'tpope/vim-haml'
      Plug 'mattn/emmet-vim'
    endif
  " }

  " Ruby {
    if count(g:spf13_bundle_groups, 'ruby')
      Plug 'tpope/vim-rails'
      let g:rubycomplete_buffer_loading = 1
      "let g:rubycomplete_classes_in_global = 1
      "let g:rubycomplete_rails = 1
    endif
  " }

  " Puppet {
    if count(g:spf13_bundle_groups, 'puppet')
      Plug 'rodjek/vim-puppet'
    endif
  " }

  " Golang {
    if count(g:spf13_bundle_groups, 'go')
      Plug 'fatih/vim-go'
    endif
  " }

  " Elixir {
    if count(g:spf13_bundle_groups, 'elixir')
      Plug 'elixir-lang/vim-elixir'
      Plug 'carlosgaldino/elixir-snippets'
      Plug 'mattreduce/vim-mix'
    endif
  " }

  " Misc {
    if count(g:spf13_bundle_groups, 'misc')
      Plug 'rust-lang/rust.vim'
      Plug 'tpope/vim-markdown'
      Plug 'spf13/vim-preview'
      Plug 'tpope/vim-cucumber'
      Plug 'cespare/vim-toml'
      Plug 'quentindecock/vim-cucumber-align-pipes'
      Plug 'saltstack/salt-vim'
    endif
  " }

  endif

  " Initialize plugin system
  call plug#end()
" }
