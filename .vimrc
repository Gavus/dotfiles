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
Plug 'tpope/vim-fugitive' " Git in vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " :Ag whatever
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox' " Gruvbox theme.
Plug 'ap/vim-css-color' " Make hex colors show their true color.

if has('nvim-0.5')
  Plug 'neovim/nvim-lspconfig' " Language server configs.
  Plug 'hrsh7th/cmp-nvim-lsp' " Autocomplete with lsp.
  Plug 'hrsh7th/cmp-buffer' " Autocomplete inside buffer.
  Plug 'hrsh7th/cmp-path' " Autocomplete in path.
  Plug 'hrsh7th/cmp-cmdline' " Autocomplete in cmdline (:).
  Plug 'hrsh7th/nvim-cmp' " The actual autocomplete plugin.
  Plug 'hrsh7th/cmp-vsnip' " Autocomplete snippets.
  Plug 'hrsh7th/vim-vsnip' " VSCode(LSP)'s snippet feature in vim.
  Plug 'rafamadriz/friendly-snippets' " The actual snippets.
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
filetype plugin indent on "
autocmd FileType c set colorcolumn=80
autocmd FileType python set colorcolumn=128
autocmd vimenter * ++nested colorscheme gruvbox


" Sort each word in visual mode.
:vnoremap <Leader>s d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>


" Place swapfiles in same path as original file.
set directory="."


" Folding.
" zo - opens folds.
" zc - closes fold.
" zm - fold all by level.
" zr - open all folds by level.
autocmd Filetype c set foldmethod=syntax
autocmd Filetype c set foldnestmax=1
autocmd Filetype go set foldmethod=syntax
autocmd Filetype go set foldnestmax=1
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldnestmax=2
" Don't fold comments when foldmenthod is syntax.
let g:c_no_comment_fold = 1


" Settings required by vimwiki.
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" Enable mouse scrolling from tmux.
set mouse=a


if executable('tmux')
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
endif


" Disable recording by unmapping its shortcut.
map q <Nop>


" Ctrlp Settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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
let g:python3_host_prog = '/usr/bin/python3'

set completeopt=menu,menuone,noselect " Settings for insert mode completion.


"  Always show at least one line above/below the cursor.
set scrolloff=1

if !has('nvim-0.5') " Stop sourcing here if nvim does not support lsp.
  finish
endif


"" Load ~/.config/nvim/lua/init.lua.
lua << EOF
  require('init')
EOF
