Keybind.g({
	{ "n", "<Space>gx", [[<Cmd>G<CR>]], { noremap = false, silent = true } },
	{ "n", "<Space>gfa", [[<Cmd>Git fetch --all<CR>]], { noremap = true, silent = true } },
	{ "n", "<Space>grum", [[<Cmd>Git rebase upstream/master<CR>]], { noremap = true, silent = true } },
	{ "n", "<Space>grom", [[<Cmd>Git rebase origin/master<CR>]], { noremap = true, silent = true } },
})

-- when solving conflicts
Keybind.g({
	-- take from left
	{ "n", "<Space>gf", [[<Cmd>diffget //2<CR>]], { noremap = false, silent = true } },
	-- take from right
	{ "n", "<Space>gj", [[<Cmd>diffget //3<CR>]], { noremap = false, silent = true } },
})
