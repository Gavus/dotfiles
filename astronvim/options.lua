return {
  opt = {
    termguicolors = true, -- Enables 24-bit RGB color in the TUI.
    guicursor="a:blinkon10", -- Make cursor blink.

    -- Text
    wrap = true, -- Wrap text.
    linebreak = true, -- Break at space.
    list = true, -- Show certain characters.
    listchars="tab:▷▷", -- Show tabs.
  },
  g = {
    vimwiki_list = {{path = '~/vimwiki', syntax = 'markdown', ext = '.md'}}, -- Make vimwiki use markdown.
    vimwiki_map_prefix = '<Leader>v', -- Change vimwiki leader key to space v.
  },
}
