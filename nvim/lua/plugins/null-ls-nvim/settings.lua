require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.formatting.prettier,
  },
})
