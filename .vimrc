" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim' " Full path fuzzy file,buffer, mru, tag, .. finder for vim.
Plug 'Raimondi/yaifa' " automatically detect tab or space indention.
Plug 'vimwiki/vimwiki' " A personal wiki for organizing. press <Leader>ww to get to the wiki.
Plug 'airblade/vim-gitgutter' " Display git changes next to line number. Move with [c or ]c.
Plug 'sotte/presenting.vim' " Presenting mode for markdown files. : PresentingStart.
Plug 'christoomey/vim-tmux-navigator' " Navigate easily with tmux and vim.
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-fugitive' " git in vim

if has('nvim-0.5')
  Plug 'neovim/nvim-lspconfig' " Languageserver configs.
  Plug 'kabouzeid/nvim-lspinstall' " Easy Lsp install. LspInstall <language>.
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " :MarkdownPreview
  Plug 'hrsh7th/nvim-compe' " recommended autocompletion with lsp.
endif


" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" Change leader key to space.
nnoremap <SPACE> <Nop>
let mapleader=" "


" Markdown preview.
" Remove error highlights. For example underscore.
hi link markdownError Normal


" Editor looks.
set number
set relativenumber
set showmatch
set list
set encoding=utf8
autocmd FileType c set colorcolumn=80
autocmd FileType python set colorcolumn=128
hi ColorColumn ctermbg=darkgray


" Sort each word in visual mode.
:vnoremap <Leader>s d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>


" Folding.
" zo - opens folds.
" zc - closes fold.
" zm - fold all by level.
" zr - open all folds by level.
autocmd Filetype c set foldmethod=syntax
autocmd Filetype c set foldnestmax=1
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldnestmax=2


" Settings required by vimwiki.
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" Enable mouse scrolling from tmux.
set mouse=a


" Share clipboard with tmux.
set clipboard+=unnamedplus
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': ['tmux', 'load-buffer', '-'],
      \      '*': ['tmux', 'load-buffer', '-'],
      \    },
      \   'paste': {
      \      '+': ['tmux', 'save-buffer', '-'],
      \      '*': ['tmux', 'save-buffer', '-'],
      \   },
      \   'cache_enabled': 1,
      \ }


" Indentation settings.
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab


" Disable recording by unmapping its shortcut.
map q <Nop>


" Nerdtree.
map <C-n> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>
let NERDTreeIgnore=['\.o$', '\.so.*$', '\.pyc$', '\~']
let g:NERDTreeWinPos = "right"


" Needed by vim-devicons.
set encoding=UTF-8


" enable line numbers.
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used.
autocmd FileType nerdtree setlocal relativenumber
" Fix conflix with vim-tmux-navigator
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""


" Make searches case insensitive by default.
set hlsearch
set incsearch
set ignorecase
set smartcase


"" File finding.
set path=.,**
set wildmenu
set wildignore+=*.o,*.pyc


"" Fuzzy finder shortcuts.
"" search for word at cursor.
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>


" Disable python2.
let g:loaded_python_provider = 0


" Stop sourcing here if nvim does not support lsp.
if !has('nvim-0.5')
  finish
endif


"" Autocomplete.
" default compe completion settings.
set completeopt=menuone,noselect
lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF


"" lspconfig
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap("n", "H", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "clangd" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
