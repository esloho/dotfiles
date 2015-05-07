execute pathogen#infect()

set background=dark

set t_Co=256
colorscheme molokai 

" Use not so dark version of molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off        " required for Vundle, restored after

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number
set hlsearch		" switch on highlighting
set ignorecase		" ignore case on searches
set enc=utf-8		" UTF-8 default encoding
set fileencodings=ucs-bom,utf-8,default,latin1
set termencoding=utf-8

syntax on		" switch syntax highlighting on
filetype plugin indent on   " required

set tabstop=4		" number of visual spaces per TAB
set softtabstop=4	" number of spaces in tab when editing
set shiftwidth=4	" number of spaces when automatic indentation
set expandtab		" tabs are spaces
set autoindent		" always set autoindenting on
set smartindent

" map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78


endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"Plugin 'scrooloose/nerdtree.git'
"Plugin 'scrooloose/syntastic.git'
"Plugin 'morhetz/gruvbox'

" All plugind must be added before the following line
"call vundle#end()   " required

