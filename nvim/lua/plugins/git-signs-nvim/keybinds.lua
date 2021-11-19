Keybind.g({
	{ 'n', '<Leader>gb', [[<Cmd>lua require('gitsigns').toggle_current_line_blame()<CR>]], { noremap = true, silent = true } },
	--{ 'n', '<Leader>gb', [[<Cmd>lua require('gitsigns').blame_line{full=true}<CR>]], { noremap = true, silent = true } },
})
