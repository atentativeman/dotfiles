" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:	 Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Last change:	         2012 Jan 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

set cursorline
"set nowrap
set showmatch

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Display line numbers on the left
"set number

" Why is this not a default
set hidden

" At least let yourself know what mode you're in
set showmode

"Store lots of :cmdline history
set history=1500

set background=dark

"relativenumber changes Vim’s line number column to display how far away each
"line is from the current one, instead of showing the absolute line number.
set relativenumber

"undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file.
"These files contain undo information so you can undo previous actions even
"after you close and reopen a file.
"set undofile

if &term =~ '256color'
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

"set t_Co=256
"colorscheme zenburn 
colorscheme wombat256mod

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
