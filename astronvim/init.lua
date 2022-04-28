-- Various setting.
vim.opt.listchars="tab:▷▷,space:⋅,eol:↴"
vim.opt.list = true
vim.g.vimwiki_list = {{path = '~/vimwiki', syntax = 'markdown', ext = '.md'}}

-- Load gruvbox theme if available
local colorscheme = "default_theme"
local colorscheme_avail, _ = pcall(require, "gruvbox")
if colorscheme_avail then
  colorscheme = "gruvbox"
end

local config = {
  colorscheme = colorscheme,
  default_theme = {
    diagnostics_style = "none",
    colors = {
      fg = "#abb2bf",
    },
    highlights = function(highlights)
      local C = require "default_theme.colors"
      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    neoscroll = false,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      { "tpope/vim-fugitive" }, -- Git in nvim
      { "nmac427/guess-indent.nvim", -- Guess tabs or whitespace indention
        config = function() require('guess-indent').setup {} end,
      },
      { "aserowy/tmux.nvim" }, -- Make copypaste between tmux and vim work
      { "ellisonleao/gruvbox.nvim" }, -- The theme
      { "sakhnik/nvim-gdb", -- Gdb wrapper -> :GdbStart *args*
        run = 'bash install.sh',
        opt = true,
        setup = [[vim.cmd('packadd nvim-gdb')]],
      },
      { "vimwiki/vimwiki", -- Add vimwiki.
        setup = [[vim.cmd('packadd vimwiki')]],
      },
    },
    ["neo-tree"] = { -- File explorer
      close_if_last_window = true,
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      lh = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
      lk = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      lg = {
        name = "Goto",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
      },
      v = {
        name = "Vimwiki",
        i = {"<cmd>VimwikiIndex<CR>", "Index"},
        d = {"<cmd>VimwikiDiaryIndex<CR>", "Diary index"},
        t = {"<cmd>VimwikiMakeDiaryNote<CR>", "Make diary note"},
        y = {"<cmd>VimwikiMakeYesterdayDiaryNote<CR>", "Make yesterday diary note"},
        g = {
          name = "Generate",
          d = {"<cmd>VimwikiDiaryGenerateLinks<CR>", "Update diary section"},
          i = {"<cmd>VimwikiGenerateLinks<CR>", "Generate links"},
        },
      },
    },
  },
}

return config
