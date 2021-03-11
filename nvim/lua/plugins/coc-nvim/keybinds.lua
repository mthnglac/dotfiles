-- GoTo code navigation.
vim.api.nvim_set_keymap('n', '<Leader>gd',  [[<Plug>(coc-definition)]], { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>gy',  [[<Plug>(coc-type-definition)]], { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>gi',  [[<Plug>(coc-implementation)]], { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>gr',  [[<Plug>(coc-references)]], { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>rr',  [[<Plug>(coc-rename)]], { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>g[',  [[<Plug>(coc-diagnostic-prev)]], { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>g]',  [[<Plug>(coc-diagnostic-next)]], { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>gp',  [[<Plug>(coc-diagnostic-prev-error)]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gn',  [[<Plug>(coc-diagnostic-next-error)]], { noremap = false, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>cr',  [[<Cmd>CocRestart<CR>]], { noremap = true, silent = false })

-- search by selected word with CoC
vim.api.nvim_set_keymap('n', '<Leader>prw',  [[<Cmd>CocSearch <C-R>=expand("<cword>")<CR><CR>]], { noremap = true, silent = false })
