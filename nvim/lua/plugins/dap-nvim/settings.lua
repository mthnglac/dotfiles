local dap = require("dap")

-- =========================
-- JavaScript / TypeScript
-- =========================
dap.adapters["pwa-node"] = {
	type = "server",
	host = "::1",
	port = "${port}",
	executable = {
		command = "node",
		args = {
			vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			"${port}",
		},
	},
}
dap.configurations.javascript = {
	{
		name = "Launch debugger through file",
		type = "pwa-node",
		request = "launch",
		program = "${file}",
		cwd = "${workspaceFolder}",
		console = "integratedTerminal",
	},
	-- {
	-- 	-- For this to work you need to make sure the node process is started with the `--inspect` flag.
	-- 	name = "Attach to existing node debug process",
	-- 	type = "pwa-node",
	-- 	request = "attach",
	-- 	processId = dap_utils.pick_process,
	-- },
}

-- =========================
-- Ruby
-- =========================
dap.adapters.ruby = function(callback, config)
	local cmd_to_run = { "bundle", "exec", config.command }
	if config.args then
		vim.list_extend(cmd_to_run, config.args)
	elseif config.script then
		table.insert(cmd_to_run, config.script)
	end

	callback({
		type = "server",
		host = "127.0.0.1",
		port = "${port}",
		executable = {
			command = "bundle",
			args = vim.list_extend({ "exec", "rdbg", "--open", "--port", "${port}", "-c", "--" }, cmd_to_run),
		},
	})
end
dap.configurations.ruby = {
	{
		type = "ruby",
		name = "Debug current ruby file",
		request = "attach",
		localfs = true,
		command = "ruby",
		script = "${file}",
		console = "integratedTerminal",
	},
	{
		type = "ruby",
		name = "Debug current ruby spec file",
		request = "attach",
		localfs = true,
		command = "rspec",
		script = "${file}",
		console = "integratedTerminal",
	},
	{
		type = "ruby",
		name = "Debug rails server",
		request = "attach",
		localfs = true,
		command = "bin/rails",
		args = { "s" },
		cwd = "${workspaceFolder}",
		console = "integratedTerminal",
	},
}

-- =========================
-- Other Configs
-- =========================h
dap.providers.configs["dap.launch.json"] = nil -- To ignore .vscode/launch.json file. Only accept predefined dap configs above.
