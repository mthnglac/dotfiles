--Keybind.g({
	--{ 'n', '<Leader>pf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true } },
--})


-- BROWSING

-- search entered word within project
vim.api.nvim_set_keymap('n', '<Leader>ps',  [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], { noremap = true, silent = true })
-- search by selected word
vim.api.nvim_set_keymap('n', '<Leader>pw',  [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], { noremap = true, silent = true })
-- search by filename in git files
vim.api.nvim_set_keymap('n', '<C-p>',  [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
-- buffer list window
vim.api.nvim_set_keymap('n', '<Leader>pb',  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
-- search by filename in all project files
vim.api.nvim_set_keymap('n', '<Leader>pf',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })


-- GIT

-- git branches
vim.api.nvim_set_keymap('n', '<Leader>gc',  [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true })
