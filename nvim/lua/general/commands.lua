vim.api.nvim_create_user_command("CopyRelativePath", [[let @+ = expand("%")]], { nargs = 0 })
vim.api.nvim_create_user_command("CopyFullPath", [[let @+ = expand("%:p")]], { nargs = 0 })
vim.api.nvim_create_user_command("CopyFileName", [[let @+ = expand("%:t")]], { nargs = 0 })
