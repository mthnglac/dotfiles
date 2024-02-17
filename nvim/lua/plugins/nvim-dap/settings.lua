local dap = require("dap")

--[[
#-------------------------------------------------------------------------#
#                                    ADAPTERS                             #
#-------------------------------------------------------------------------#
--]]
-- node-debug2
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

--[[
#-------------------------------------------------------------------------#
#                                    CONFS                                #
#-------------------------------------------------------------------------#
--]]
dap.configurations.javascript = {
	{
		name = "JS Debugger",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}
