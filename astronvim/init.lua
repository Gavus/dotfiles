local config = {
  updater = {
    channel = "stable", -- "stable" or "nightly"
    auto_reload = true,
    auto_quit = true,
  },

  colorscheme = "gruvbox",

  options = {
    opt = {
      linebreak = true, -- break at space.
      list = true, -- show certain characters.
      listchars = "tab:▷▷", -- show tabs.
      colorcolumn = "80",
    },
    g = {
      vimwiki_list = { { path = '~/vimwiki', syntax = 'markdown', ext = '.md' } }, -- make vimwiki use markdown.
      vimwiki_map_prefix = '<leader>v', -- change vimwiki leader key to space v.
      vimwiki_links_space_char = '-', -- make vimwiki create names with - instead of space.
    },
  },

  lsp = {
    formatting = { format_on_save = { enabled = false, }, },
    ["server-settings"] = {
      clangd = { capabilities = { offsetEncoding = 'utf-8' }, },
      sourcery = { init_options = { token = '' }, },
    },
  },

  mappings = {
    n = {
      ["<leader>lH"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header" },
      ["<leader>v"] = { "empty", desc = "VimWiki" },
    },
  },

  plugins = {
    init = {
      ["goolord/alpha-nvim"] = { disable = true }, -- Remove dashboard.
      { "ellisonleao/gruvbox.nvim" },
      { "vimwiki/vimwiki", setup = [[vim.cmd('packadd vimwiki')]], },
      { "aserowy/tmux.nvim" },
    },
    ["neo-tree"] = { window = { position = "right", }, },
    ["notify"] = { stages = "static", },
    ["smart-splits"] = { tmux_integration = false, },
  },
}
return config
