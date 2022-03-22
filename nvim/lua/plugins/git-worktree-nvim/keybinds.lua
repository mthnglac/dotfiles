Keybind.g({
	{ 'n', '<Leader>gw', [[<Cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>]], { noremap = true, silent = false } },
	{ 'n', '<Leader>gm', [[<Cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>]], { noremap = true, silent = false } },
})
