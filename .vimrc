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
  " markdown preview
  " :MarkdownPreview
  " :MarkdownStop
  " :MarkdownToggl
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
endif
" Autocompletion
" Dont forget pip3 install pynvim
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
" Navigate easily with tmux and vim
Plug 'christoomey/vim-tmux-navigator'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" Change leader key to space
nnoremap <SPACE> <Nop>
let mapleader=" "


" Editor looks
set number
set relativenumber
set showmatch
set list
set encoding=utf8


" Indentation settings
set tabstop=4
set softtabstop=2
set shiftwidth=2
set noexpandtab


" Disable recording by unmapping its shortcut
map q <Nop>


" Nerdtree shortcuts
map <C-n> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>


" Make searches case insensitive by default
set hlsearch
set incsearch
set ignorecase
set smartcase


"" File finding
set path=.,**
set wildmenu
set wildignore+=*.o,*.pyc


"" Fuzzy finder shortcuts
"" search for word at cursor
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>


"" language server protocol settings
if has('nvim-0.5')
  if executable('cmake-language-server')
    lua require'lspconfig'.cmake.setup{}
  endif

  if executable('clangd') && filereadable('compile_commands.json')
  lua require'lspconfig'.clangd.setup{}
    map <F2> :ClangdSwitchSourceHeader<cr>
  endif

  "" Shortcuts
  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

endif


" Disable python2 
let g:loaded_python_provider = 0
