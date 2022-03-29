-- Show tabs
vim.opt.listchars="tab:▷▷,space:⋅,eol:↴"
vim.opt.list = true

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
      { "sakhnik/nvim-gdb", -- Gdb wrapper
        run = 'bash install.sh',
        opt = true,
        setup = [[vim.cmd('packadd nvim-gdb')]],
      },
    },
    ["nvim-tree"] = { -- File explorer
      view = {
        number = true,
        relativenumber = true,
        side = "right",
      },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      ["lk"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
      ["lh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      lg = {
        name = "Goto",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
      },
    },
  },
}

return config
