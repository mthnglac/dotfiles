-- BROWSING

Keybind.g({
	-- search entered word within project
	{ 'n', '<Leader>ps', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], { noremap = true, silent = true } },
	-- search by selected word
	{ 'n', '<Leader>pw', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], { noremap = true, silent = true } },
	-- search by filename in git files
	{ 'n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true } },
	-- buffer list window
	{ 'n', '<Leader>pb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true } },
	-- search by filename in all project files
	{ 'n', '<Leader>pf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true } },
	-- telescope through dotfiles
	{ 'n', '<Leader>prc', [[<Cmd>lua require('plugins.telescope.settings').search_dotfiles()<CR>]], { noremap = true, silent=true } },
	-- telescope firefox frecency
	{ 'n', '<Leader>pc', [[<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>]], { noremap = true, silent=true } },
})


-- GIT

Keybind.g({
	-- git branches
	{ 'n', '<Leader>gc', [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true } },
})
