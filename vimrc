" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ----------------------------------------------------------------------------
"  Vundle setup
" ----------------------------------------------------------------------------
filetype off                   " Required for Vundle

set rtp+=~/.vim/bundle/vundle/ " Add vundle to the RuntimePath
call vundle#rc()

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'

" Language-specific syntax files
"Bundle 'vim-ruby/vim-ruby'

" Comment plugin
Bundle 'tpope/vim-commentary'

" Syntax check on buffer save
"Bundle 'scrooloose/syntastic'

" Git plugins
"Bundle 'tpope/vim-fugitive'
"Bundle 'gregsexton/gitv'
Bundle  'godlygeek/tabular'

" Lightweight support for Ruby's Bundler
"Bundle 'tpope/vim-bundler'

" Various editing plugins
"Bundle 'tpope/vim-repeat'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-unimpaired'
"Bundle 'nelstrom/vim-visual-star-search'
"Bundle 'ZoomWin'
"Bundle 'ervandew/supertab'
"Bundle 'tpope/vim-endwise'
"Bundle 'godlygeek/tabular'

" File managers/explorers
"Bundle 'kien/ctrlp.vim'
"Bundle 'mileszs/ack.vim'

" Colorschemes
"Bundle 'altercation/vim-colors-solarized'

if has('autocmd')
    filetype plugin indent on   " Turn on Filetype detection, plugins, and
                                " indent
    endif
    if has('syntax') && !exists('g:syntax_on')
      syntax enable             " Turn on syntax highlighting
    endif

" ----------------------------------------------------------------------------
"  moving around, searching and patterns
" ----------------------------------------------------------------------------
set nostartofline      " keep cursor in same column for long-range motion cmds
set incsearch          " Highlight pattern matches as you type
set hlsearch           " Highlight all matched patterns 
set ignorecase         " ignore case when using a search pattern
set smartcase          " override 'ignorecase' when pattern
                       " has upper case character

" ----------------------------------------------------------------------------
"  tags
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  displaying text
" ----------------------------------------------------------------------------
set scrolloff=3        " number of screen lines to show around
                       " the cursor

set linebreak          " For lines longer than the window,
                       " wrap intelligently. This doesn't
                       " insert hard line breaks.

set showbreak=↪\ \     " string to put before wrapped screen
                       " lines

set sidescrolloff=2    " min # of columns to keep left/right of cursor
set display+=lastline  " show last line, even if it doesn't fit in the window

set cmdheight=2        " # of lines for the command window
                       " cmdheight=2 helps avoid 'Press ENTER...'
                       " prompts

" Define characters to show when you show formatting
" stolen from https://github.com/tpope/vim-sensible
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif

"set number        " show line numbers
set relativenumber " show line numbers relative to the cursor
" ----------------------------------------------------------------------------
"  syntax, highlighting and spelling
" ----------------------------------------------------------------------------
set background=dark
"set colorcolumn=80    " display a line in column 80 to show you
                      " when to line break.
colorscheme wombat256mod

" ----------------------------------------------------------------------------
"  multiple windows
" ----------------------------------------------------------------------------
set laststatus=2      " Show a status line, even if there's only one
                      " Vim window

set hidden            " allow switching away from current buffer w/o
                      " writing

set switchbuf=usetab  " Jump to the 1st open window which contains
                      " specified buffer, even if the buffer is in
                      " another tab.
                      " TODO: Add 'split' if you want to split the
                      " current window for a quickfix error window.

set statusline=
set statusline+=b%-1.3n\ > " buffer number
"set statusline+=\ %{fugitive#statusline()}:
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%R
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ <\ %{&fenc}
set statusline+=\ <\ %{&ff}
set statusline+=\ <\ %p%%
set statusline+=\ %l:
set statusline+=%02.3c    " cursor line/total lines

set helpheight=30         " Set window height when opening Vim help windows

" ----------------------------------------------------------------------------
"  multiple tab pages
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  terminal
" ----------------------------------------------------------------------------
set ttyfast           " this is the 21st century, people

" ----------------------------------------------------------------------------
"  using the mouse
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  GUI              " Set these options in .gvimrc
" See help for 'setting-guifont' for tips on how to set guifont on Mac vs Windows
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  printing
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  messages and info
" ----------------------------------------------------------------------------

set showcmd         " In the status bar, show incomplete commands
                    " as they are typed

set ruler           " Always display the current cursor position in
                    " the Status Bar

set confirm         " Ask to save buffer instead of failing when executing
                    " commands which close buffers

" ----------------------------------------------------------------------------
"  selecting text
" ----------------------------------------------------------------------------
set clipboard=unnamed " Yank to the system clipboard by default

" ----------------------------------------------------------------------------
"  editing text       " TODO: look at these options
" ----------------------------------------------------------------------------
set backspace=indent,eol,start  "backspace over everything

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j   " delete comment char on second line when joining two commented lines
endif

set showmatch            " when inserting a bracket, briefly jump to its
                         " match

set nojoinspaces         " Use only one space after '.' when joining
                         " lines, instead of two

"set completeopt+=longest " better omni-complete menu

"set nrformats-=octal     " don't treat numbers with leading zeros as octal when incrementing/decrementing

" ----------------------------------------------------------------------------
"  tabs and indenting
" ----------------------------------------------------------------------------
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set shiftround            " round to 'shiftwidth' for "<<" and ">>" 

" ----------------------------------------------------------------------------
"  folding
" ----------------------------------------------------------------------------
set nofoldenable          " When opening files, all folds open by default

" ----------------------------------------------------------------------------
"  diff mode
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  mapping
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  reading and writing files
" ----------------------------------------------------------------------------
set autoread          " Automatically re-read files changed outside
                      " of Vim

" ----------------------------------------------------------------------------
"  the swap file
" ----------------------------------------------------------------------------

if has("win32") || has("win64")
  set directory=$TEMP
else
  " Vim will try this ordered list of directories for .swp files
  set directory=~/tmp,.,/var/tmp,/tmp
endif

" ----------------------------------------------------------------------------
"  command line editing
" ----------------------------------------------------------------------------
set history=1000    " Save more commands in history
                    " See Practical Vim, by Drew Neil, pg 68

set wildmode=list:longest,full

" File tab completion ignores these file patterns
set wildignore+=*.exe,*.swp,.DS_Store
set wildmenu

" Configure persistent undo
if v:version >= 703 && has("persistent_undo")
  set undofile
  set undodir=$HOME/.vim/undo
endif

" Add guard around 'wildignorecase' to prevent terminal vim error
if exists('&wildignorecase')
  set wildignorecase
endif

" ----------------------------------------------------------------------------
"  executing external commands
" ----------------------------------------------------------------------------

"if has("win32") || has("gui_win32")
"  if executable("PowerShell")
"    " Set PowerShell as the shell for running external ! commands
"    " http://stackoverflow.com/questions/7605917/system-with-powershell-in-vim
"    set shell=PowerShell
"    set shellcmdflag=-ExecutionPolicy\ RemoteSigned\ -Command
"    set shellquote=\"
"    " TODO: shellxquote must be a literal space character.
"    " Fix my trim trailing whitespace command to not run automatically on save
"    set shellxquote= 
"  endif
"endif

" ----------------------------------------------------------------------------
"  running make and jumping to errors
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  language specific
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  multi-byte characters
" ----------------------------------------------------------------------------
set encoding=utf-8

" ----------------------------------------------------------------------------
"  various
" ----------------------------------------------------------------------------
"set gdefault                    " For :substitute, use the /g flag by default

" ----------------------------------------------------------------------------
" Autocmds
" ----------------------------------------------------------------------------

" Make gf work on Chef include_recipe lines
" Add all cookbooks/*/recipe dirs to Vim's path variable
"autocmd BufRead,BufNewFile */cookbooks/*/recipes/*.rb setlocal path+=recipes;/cookbooks/**1


" ----------------------------------------------------------------------------
" Allow overriding these settings
" ----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
