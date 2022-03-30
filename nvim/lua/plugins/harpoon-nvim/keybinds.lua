Keybind.g({
	{ 'n', '<Leader>ta', [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = false } },
	{ 'n', '<Leader>tc', [[<Cmd>Telescope harpoon marks<CR>]], { noremap = true, silent = true } },
})
