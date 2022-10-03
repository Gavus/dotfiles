return {
  opt = {
    termguicolors = true, -- Enables 24-bit RGB color in the TUI.

    -- Text
    linebreak = true, -- Break at space.
    list = true, -- Show certain characters.
    listchars = "tab:▷▷", -- Show tabs.
    tabstop = 4, -- Tab is the same width as 4 whitespaces.
    shiftwidth = 0, -- Match tabstop instead.
    colorcolumn = "80",
  },
  g = {
    vimwiki_list = {{path = '~/vimwiki', syntax = 'markdown', ext = '.md'}}, -- Make vimwiki use markdown.
    vimwiki_map_prefix = '<Leader>v', -- Change vimwiki leader key to space v.
    vimwiki_links_space_char = '-', -- Make vimwiki create names with - instead of space.
  },
}
