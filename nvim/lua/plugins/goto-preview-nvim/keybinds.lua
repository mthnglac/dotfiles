Keybind.g({
	{
		"n",
		"<Space>gpd",
		[[<cmd>lua require('goto-preview').goto_preview_definition()<CR>]],
		{ noremap = true, silent = true },
	},
	{
		"n",
		"<Space>gpt",
		[[<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>]],
		{ noremap = true, silent = true },
	},
	{
		"n",
		"<Space>gpi",
		[[<cmd>lua require('goto-preview').goto_preview_implementation()<CR>]],
		{ noremap = true, silent = true },
	},
	{
		"n",
		"<Space>gpD",
		[[<cmd>lua require('goto-preview').goto_preview_declaration()<CR>]],
		{ noremap = true, silent = true },
	},
	{
		"n",
		"<Space>gP",
		[[<cmd>lua require('goto-preview').close_all_win()<CR>]],
		{ noremap = true, silent = true },
	},
	-- if telescope installed
	{
		"n",
		"<Space>gpr",
		[[<cmd>lua require('goto-preview').goto_preview_references()<CR>]],
		{ noremap = true, silent = true },
	},
})
