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
set encoding=utf8
set listchars=tab:»\ ,space:·


" Indentation settings
set tabstop=4
set softtabstop=2
set shiftwidth=2
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


"" Clang-format
map <C-K> :ClangFormat<cr>

"" Clangd integration
if has('nvim-0.5')
  if executable('cmake-language-server')
    lua require'lspconfig'.cmake.setup{}
  endif

  if executable('clangd') && filereadable('compile_commands.json')
  lua require'lspconfig'.clangd.setup{}
    map <F2> :ClangdSwitchSourceHeader<cr>
    nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> ]d    <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>
    nnoremap <silent> [d    <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
    nnoremap <silent> gh    <cmd>lua vim.lsp.buf.signature_help()<CR>
  endif
endif

