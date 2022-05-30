-- Various setting.
vim.opt.listchars="tab:▷▷,space:⋅,eol:↴"
vim.opt.list = true
vim.g.vimwiki_list = {{path = '~/vimwiki', syntax = 'markdown', ext = '.md'}}
vim.g.vimwiki_key_mappings = { all_maps = 0 }

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

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      ["declancm/cinnamon.nvim"] = { disable = true },
      ["goolord/alpha-nvim"] = { disable = true },
      { "nmac427/guess-indent.nvim", -- Guess tabs or whitespace indention
        config = function() require('guess-indent').setup {} end,
      },
      { "aserowy/tmux.nvim", -- merge nvim and tmux.
        config = function() require("tmux").setup({
          copy_sync = { enable = true, },
          navigation = { enable_default_keybindings = false }, -- (C-hjkl)
          resize = { enable_default_keybindings = false }, -- (A-hjkl)
        }) end,
      },
      { "ellisonleao/gruvbox.nvim" }, -- The theme
      { "vimwiki/vimwiki", -- Add vimwiki.
        setup = [[vim.cmd('packadd vimwiki')]],
      },
    },
    ["neo-tree"] = { -- File explorer
      close_if_last_window = true,
      window =  {
        position = "right",
      },
    },
    { "aerial", -- symbols outline
      default_direction = "prefer_left",
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
        i = {"<Plug>VimwikiIndex", "Index"},
        d = {"<Plug>VimwikiDiaryIndex", "Diary index"},
        t = {"<Plug>VimwikiMakeDiaryNote", "Make diary note"},
        y = {"<Plug>VimwikiMakeYesterdayDiaryNote", "Make yesterday diary note"},
        g = {
          name = "Generate",
          d = {"<Plug>VimwikiDiaryGenerateLinks", "Update diary section"},
          i = {"<Plug>VimwikiGenerateLinks", "Generate links"},
        },
      },
    },
  },
}

return config
