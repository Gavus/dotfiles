return {
  opt = {
    termguicolors = true, -- Enables 24-bit RGB color in the TUI.
    guicursor="n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkon10", -- Make cursor blink.

    -- Text
    wrap = true, -- Wrap text.
    linebreak = true, -- Break at space.
    list = true, -- Show certain characters.
    listchars="tab:▷▷", -- Show tabs.
    tabstop=4 -- Tab is the same width as 4 whitespaces.
  },
  g = {
    vimwiki_list = {{path = '~/vimwiki', syntax = 'markdown', ext = '.md'}}, -- Make vimwiki use markdown.
    vimwiki_map_prefix = '<Leader>v', -- Change vimwiki leader key to space v.
    vimwiki_links_space_char = '-', -- Make vimwiki create names with - instead of space.
  },
}
