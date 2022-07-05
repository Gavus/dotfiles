return {
  ["declancm/cinnamon.nvim"] = { disable = true }, --Disable cursor "animation".
  ["goolord/alpha-nvim"] = { disable = true }, -- Disable dashboard.
  ["Darazaki/indent-o-matic"] = { disable = true }, -- Disable crappy auto indention.
  ["tpope/vim-fugitive"] = {}, -- Another git plugin.
  ["ellisonleao/gruvbox.nvim"] = {}, -- Another theme.
  ["phaazon/hop.nvim"] = {
    cmd = "lua require('hop').setup()",
    setup = function() require('hop').setup {} end,
  },
  ["aserowy/tmux.nvim"] = { -- merge nvim and tmux.
    config = function() require("tmux").setup({
      copy_sync = { enable = true, },
      navigation = { enable_default_keybindings = false }, -- (C-hjkl)
      resize = { enable_default_keybindings = false }, -- (A-hjkl)
    }) end,
  },
  ["vimwiki/vimwiki"] = { -- Add vimwiki.
    setup = [[vim.cmd('packadd vimwiki')]],
  },
  ['nmac427/guess-indent.nvim'] = {
    event = "BufReadPost",
    config = function() require('guess-indent').setup {} end,
  },
}
