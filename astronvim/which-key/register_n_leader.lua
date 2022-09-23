return {
  lg = {
    name = "Goto",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
  },
  lh = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
  lH = { "<cmd>ClangdSwitchSourceHeader<CR>", "Switch source/header" },
  lk = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  v = { name = "Vimwiki" },
}
