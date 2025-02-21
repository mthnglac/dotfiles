-- Power on/off
Keybind.g({
	{
		"n",
		"<F4>",
		"<Cmd>lua require('dapui').setup()<CR><Cmd>lua require('dapui').open()<CR>",
		{ noremap = true, silent = false, desc = "Debugger: Start the session UI" },
	},
})
Keybind.g({
	{
		"n",
		"<F5>",
		[[<Cmd>lua require('dap').continue()<CR>]],
		{ noremap = true, silent = false, desc = "Debugger: Start the session" },
	},
})
Keybind.g({
	{
		"n",
		"<Space>vq",
		[[
      <Cmd>lua require('dapui').close()<CR><Cmd>lua require('dap').terminate()<CR>
    ]],
		{ noremap = true, silent = false, desc = "Debugger: Terminate the session" },
	},
})

-- Breakpoint
Keybind.g({
	{
		"n",
		"<Space>vb",
		[[<Cmd>lua require('dap').toggle_breakpoint()<CR>]],
		{ noremap = true, silent = true, desc = "Debugger: Toggle breakpoint" },
	},
})

-- Steps
Keybind.g({
	{
		"n",
		"<Space>vc",
		[[<Cmd>lua require('dap').continue()<CR>]],
		{ noremap = true, silent = false, desc = "Debugger: Continue" },
	},
})
Keybind.g({
	{
		"n",
		"<Space>vss",
		[[<Cmd>lua require('dap').step_over()<CR>]],
		{ noremap = true, silent = true, desc = "Debugger: Step Over" },
	},
})
Keybind.g({
	{
		"n",
		"<Space>vsi",
		[[<Cmd>lua require('dap').step_into()<CR>]],
		{ noremap = true, silent = true, desc = "Debugger: Step Into" },
	},
})
Keybind.g({
	{
		"n",
		"<Space>vso",
		[[<Cmd>lua require('dap').step_out()<CR>]],
		{ noremap = true, silent = true, desc = "Debugger: Step Out" },
	},
})
