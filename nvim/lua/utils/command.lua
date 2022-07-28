local Command = {}

Command.cmd = function(commands)
	for _, value in ipairs(commands) do
    vim.api.nvim_command(value)
	end
end

return Command
