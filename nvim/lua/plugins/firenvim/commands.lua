local group = vim.api.nvim_create_augroup("FireNvim", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "github.com_*.txt",
  command = "set filetype=markdown",
  group = group,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "txti.es_*.txt",
  command = "set filetype=typescript",
  group = group,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "stackoverflow_*.txt",
  command = "set filetype=markdown",
  group = group,
})
