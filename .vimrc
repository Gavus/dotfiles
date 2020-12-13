" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree'
" Full path fuzzy file,buffer, mru, tag, .. finder for vim.
Plug 'kien/ctrlp.vim'
" Clang format support.
Plug 'rhysd/vim-clang-format'
if has('nvim-0.5')
  " Languageserver configs.
  Plug 'neovim/nvim-lspconfig'
endif
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" Editor looks
set number
set relativenumber
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
