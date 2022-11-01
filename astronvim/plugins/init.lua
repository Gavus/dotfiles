return {
  { "ellisonleao/gruvbox.nvim" }, -- Another theme.
  { "ntpeters/vim-better-whitespace" },
  { "aserowy/tmux.nvim", -- merge nvim and tmux.
    config = function() require("tmux").setup({
      copy_sync = { enable = true, },
    }) end,
  },
  { "vimwiki/vimwiki", -- Add vimwiki.
    setup = [[vim.cmd('packadd vimwiki')]],
  },
}
