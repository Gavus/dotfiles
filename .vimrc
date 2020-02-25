set nocompatible
syntax enable
filetype off

" VUNDLE SETUP: 
" Install with :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Bundle 'christoomey/vim-tmux-navigator'
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


" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" CLANG-FORMAT:
" map <C-I> :py3file /usr/share/vim/addons/syntax/clang-format.py<cr>
" imap <C-I> <c-o>:py3file /usr/share/vim/addons/syntax/clang-format.py<cr>


" Format current python file using YAPF:
" :!yapf -i %

set number relativenumber
set nu rnu

" Disable recording by unmapping its shortcut
map q <Nop>

" Nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>
