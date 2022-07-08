return {
  lh = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
  lk = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  lg = {
    name = "Goto",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
  },
  v = { name = "Vimwiki" },
  j = { name = "Jump in buffer",
    a = { "<cmd>HopAnywhere<CR>", "Anywhere" },
    d = {"<cmd>HopAnywhereAC<CR>", "Down" },
    u = {"<cmd>HopAnywhereBC<CR>", "Up" },
  },
}