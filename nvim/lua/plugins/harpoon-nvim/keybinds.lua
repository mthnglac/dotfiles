Keybind.g({
	{ 'n', '<Leader>ta', [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true } },
	{ 'n', '<Leader>tc', [[<Cmd>Telescope harpoon marks<CR>]], { noremap = true } },

	{ 'n', '<Leader>t1', [[<Cmd>lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true } },
	{ 'n', '<Leader>t2', [[<Cmd>lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true } },
	{ 'n', '<Leader>t3', [[<Cmd>lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true } },
	{ 'n', '<Leader>t4', [[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true } },
	{ 'n', '<Leader>t5', [[<Cmd>lua require("harpoon.ui").nav_file(5)<CR>]], { noremap = true } },
})
