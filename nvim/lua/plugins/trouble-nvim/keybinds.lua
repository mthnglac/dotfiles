Keybind.g({
	{
		"n",
		"<Space>xx",
		[[<Cmd>Trouble diagnostics toggle<CR>]],
		{ noremap = true, silent = true, desc = "Diagnostics (Trouble)" },
	},
	{
		"n",
		"<Space>xX",
		[[<Cmd>Trouble diagnostics toggle filter.buf=0<CR>]],
		{ noremap = true, silent = true, desc = "Buffer Diagnostics (Trouble)" },
	},
	{
		"n",
		"<Space>cs",
		[[<Cmd>Trouble symbols toggle focus=false<CR>]],
		{ noremap = true, silent = true, desc = "Symbols (Trouble)" },
	},
	{
		"n",
		"<Space>cl",
		[[<Cmd>Trouble lsp toggle focus=false win.position=right<CR>]],
		{ noremap = true, silent = true, desc = "LSP Definitions / references / ... (Trouble)" },
	},
	{
		"n",
		"<Space>xL",
		[[<Cmd>Trouble loclist toggle<CR>]],
		{ noremap = true, silent = true, desc = "Location List (Trouble)" },
	},
	{
		"n",
		"<Space>xQ",
		[[<Cmd>Trouble qflist toggle<CR>]],
		{ noremap = true, silent = true, desc = "Quickfix List (Trouble)" },
	},
})
