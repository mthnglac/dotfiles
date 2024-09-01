Keybind.g({
	{
		"n",
		"<Space>gwl",
		[[<Cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>]],
		{ noremap = true, silent = false },
	},
	{
		"n",
		"<Space>gwc",
		[[<Cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>]],
		{ noremap = true, silent = false },
	},
})
