set nocompatible
syntax enable
filetype off

" VUNDLE SETUP: 
" Install with :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-scripts/ZoomWin'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
call vundle#end()
filetype plugin on


" FINDING FILES:
" " Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" CLANG-FORMAT:
" - :ClangFormatAutoEnable formats on save

" Format current python file using YAPF:
" :!yapf -i %

set number relativenumber
set nu rnu

" Disable recording by unmapping its shortcut
map q <Nop>

" Nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

" Make searches case insensitive by default
:set ignorecase
:set smartcase

packloadall
silent! helptags ALL

