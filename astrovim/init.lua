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
      { "tpope/vim-fugitive" },
      { "nmac427/guess-indent.nvim",
         config = function() require('guess-indent').setup {} end,
      },
      { "aserowy/tmux.nvim" },
      { "ellisonleao/gruvbox.nvim" }
    },
    ["nvim-tree"] = {
      view = {
        side = "right",
        number = true,
        relativenumber = true,
      },
    },
  },
}

return config
