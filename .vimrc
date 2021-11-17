" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree' " A file explorer.
Plug 'Xuyuanp/nerdtree-git-plugin' " Adds icons for git changes in nerd tree.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nice icons for nerd tree, requires vim-devicons.
Plug 'ryanoasis/vim-devicons' " Makes it possible to use nerd iconds. Download Source Code Pro Nerd Font.
Plug 'kien/ctrlp.vim' " Full path fuzzy file,buffer, mru, tag, .. finder for vim.
Plug 'Raimondi/yaifa' " Automatically detect tab or space indention.
Plug 'vimwiki/vimwiki' " A personal wiki for organizing. press <Leader>ww to get to the wiki.
Plug 'airblade/vim-gitgutter' " Display git changes next to line number. Move with [c or ]c.
Plug 'sotte/presenting.vim' " Presenting mode for markdown files. : PresentingStart.
Plug 'christoomey/vim-tmux-navigator' " Navigate easily with tmux and vim.
Plug 'Raimondi/delimitMate' " Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-fugitive' " Git in vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if has('nvim-0.5')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'L3MON4D3/LuaSnip' " For luasnip users.
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'williamboman/nvim-lsp-installer' " Easy Lsp install. :LspInstall <language>.
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " :MarkdownPreview.
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
hi Pmenu ctermbg=blue


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


" Disable recording by unmapping its shortcut.
map q <Nop>


" Nerdtree.
" Open nerdtree.
map <C-n> :NERDTreeToggle<CR>
" Locate open buffer in nerdtree.
nmap ,n :NERDTreeFind<CR>
let NERDTreeIgnore=['\.o$', '\.so.*$', '\.pyc$', '\~'] " Ignore certain filetypes.
let g:NERDTreeWinPos = "right"
let NERDTreeShowLineNumbers=1 " Enable line numbers.
autocmd FileType nerdtree setlocal relativenumber " Make sure relative line numbers are used.
" Fix conflix with vim-tmux-navigator
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""


" Needed by vim-devicons.
set encoding=UTF-8


" Make searches case insensitive by default.
set hlsearch
set incsearch
set ignorecase
set smartcase


"" File finding.
set path=.,**
set wildmenu
set wildignore+=*.o,*.pyc


"" Fuzzy finder shortcuts
"" search for word at cursor
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>


let g:loaded_python_provider = 0 " Disable python2.


if !has('nvim-0.5') " Stop sourcing here if nvim does not support lsp.
  finish
endif


"" lspconfig: Almost default
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

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
  local servers = { "clangd", "dockerls", "gopls", "pyright", "vimls" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  -- Set completeopt to have a better completion experience
  vim.o.completeopt = 'menu,menuone,noselect'

  -- luasnip setup
  local luasnip = require 'luasnip'

  -- nvim-cmp setup
  local cmp = require 'cmp'
  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
        else
          fallback()
        end
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF
