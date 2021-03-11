vim.api.nvim_set_keymap('n', '<Leader>gs',  [[<Cmd>G<CR>]], { noremap = false, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>ga',  [[<Cmd>Git fetch --all<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>grum',  [[<Cmd>Git rebase upstream/master<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>grom',  [[<Cmd>Git rebase origin/master<CR>]], { noremap = true, silent = true })

-- when solving conflicts
-- take from left
vim.api.nvim_set_keymap('n', '<Leader>gf',  [[<Cmd>diffget //2<CR>]], { noremap = false, silent = true })
-- take from right
vim.api.nvim_set_keymap('n', '<Leader>gj',  [[<Cmd>diffget //3<CR>]], { noremap = false, silent = true })
