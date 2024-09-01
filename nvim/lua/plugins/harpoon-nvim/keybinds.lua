Keybind.g({
	{ "n", "<Space>ta", [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true } },
	{ "n", "<Space>tc", [[<Cmd>Telescope harpoon marks<CR>]], { noremap = true } },

	{ "n", "<Space>t1", [[<Cmd>lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true } },
	{ "n", "<Space>t2", [[<Cmd>lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true } },
	{ "n", "<Space>t3", [[<Cmd>lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true } },
	{ "n", "<Space>t4", [[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true } },
	{ "n", "<Space>t5", [[<Cmd>lua require("harpoon.ui").nav_file(5)<CR>]], { noremap = true } },
})
