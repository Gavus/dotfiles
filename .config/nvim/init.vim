" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'vim-scripts/ZoomWin'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" Editor looks
set number
set relativenumber
set cursorline
set showmatch
set list
set listchars=tab:»\ ,space:·


" Indentation settings
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab


" Disable recording by unmapping its shortcut
map q <Nop>


" Nerdtree shortcuts
map <C-n> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>


" Make searches case insensitive by default
:set ignorecase
:set smartcase


"" File finding
set path=.,**
set wildmenu
set wildignore+=*.o,*.pyc
