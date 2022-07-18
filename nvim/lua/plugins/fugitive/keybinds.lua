Keybind.g({
	{ "n", "<Leader>gs", [[<Cmd>G<CR>]], { noremap = false, silent = true } },
	{ "n", "<Leader>ga", [[<Cmd>Git fetch --all<CR>]], { noremap = true, silent = true } },
	{ "n", "<Leader>grum", [[<Cmd>Git rebase upstream/master<CR>]], { noremap = true, silent = true } },
	{ "n", "<Leader>grom", [[<Cmd>Git rebase origin/master<CR>]], { noremap = true, silent = true } },
})

-- when solving conflicts
Keybind.g({
	-- take from left
	{ "n", "<Leader>gf", [[<Cmd>diffget //2<CR>]], { noremap = false, silent = true } },
	-- take from right
	{ "n", "<Leader>gj", [[<Cmd>diffget //3<CR>]], { noremap = false, silent = true } },
})
