Keybind.g({
	{ 'n', '<leader>gs', '<cmd>G<cr>' },

	{ 'n', '<leader>gc', '<cmd>GBranches<cr>', { noremap = true } },
	{ 'n', '<leader>ga', '<cmd>Git fetch --all<cr>', { noremap = true } },
	{ 'n', '<leader>grum', '<cmd>Git rebase upstream/master<cr>', { noremap = true } },
	{ 'n', '<leader>grom', '<cmd>Git rebase origin/master<cr>', { noremap = true } },

	-- when solving conflicts
	-- take from left
	{ 'n', '<leader>gf', '<cmd>diffget //2<cr>' },
	-- take from right
	{ 'n', '<leader>gj', '<cmd>diffget //3<cr>' },
})
