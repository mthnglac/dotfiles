-- highlight on yank!!!
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = "*",
  callback = function()
    require("vim.highlight").on_yank({ timeout = 400 })
  end
})
