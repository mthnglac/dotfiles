Keybind.g({
	{ 'n', '<Leader>ta', [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = true } },
	{ 'n', '<Leader>tc', [[<Cmd>Telescope harpoon marks<CR>]], { noremap = true, silent = true } },

	{ 'n', '<Leader><C-u>', [[<Cmd>lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true, silent = true } },
	{ 'n', '<Leader><C-i>', [[<Cmd>lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true, silent = true } },
	{ 'n', '<Leader><C-o>', [[<Cmd>lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true, silent = true } },
	{ 'n', '<Leader><C-p>', [[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true, silent = true } },
})
