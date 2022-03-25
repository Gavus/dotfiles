-- Theme setup.
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'gruvbox'
    -- ... your lualine config
  }
}

-- Load the colorscheme
vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
