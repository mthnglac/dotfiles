-- Power on/off
Keybind.g({
	{
		"n",
		"<F4>",
		"<Cmd>lua require('dapui').setup()<CR><Cmd>lua require('dapui').open()<CR>",
		{ noremap = true, silent = false },
	},
})
Keybind.g({
	{
		"n",
		"<F5>",
		[[<Cmd>lua require('dap').continue()<CR>]],
		{ noremap = true, silent = false },
	},
})
Keybind.g({
	{
		"n",
		"<Space>vq",
		[[
      <Cmd>lua require('dapui').close()<CR><Cmd>lua require('dap').terminate()<CR>
    ]],
		{ noremap = true, silent = false },
	},
})

-- Breakpoint
Keybind.g({
	{
		"n",
		"<Space>vb",
		[[<Cmd>lua require('dap').toggle_breakpoint()<CR>]],
		{ noremap = true, silent = true },
	},
})

-- Steps
Keybind.g({
	{
		"n",
		"<Space>vc",
		[[<Cmd>lua require('dap').continue()<CR>]],
		{ noremap = true, silent = false },
	},
})
Keybind.g({
	{
		"n",
		"<Space>vss",
		[[<Cmd>lua require('dap').step_over()<CR>]],
		{ noremap = true, silent = true },
	},
})
Keybind.g({
	{
		"n",
		"<Space>vsi",
		[[<Cmd>lua require('dap').step_into()<CR>]],
		{ noremap = true, silent = true },
	},
})
Keybind.g({
	{
		"n",
		"<Space>vso",
		[[<Cmd>lua require('dap').step_out()<CR>]],
		{ noremap = true, silent = true },
	},
})
