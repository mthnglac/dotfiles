Keybind.g({
	{ 'n', '<Leader>gpd', [[<cmd>lua require('goto-preview').goto_preview_definition()<CR>]], { noremap = true, silent = true } },
	{ 'n', '<Leader>gpi', [[<cmd>lua require('goto-preview').goto_preview_implementation()<CR>]], { noremap = true, silent = true } },
	{ 'n', '<Leader>gP', [[<cmd>lua require('goto-preview').close_all_win()<CR>]], { noremap = true, silent = true } },
  -- if telescope installed
	{ 'n', '<Leader>gpr', [[<cmd>lua require('goto-preview').goto_preview_references()<CR>]], { noremap = true, silent = true } },
})
