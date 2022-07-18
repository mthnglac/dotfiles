local Type = {
	GLOBAL_OPTION = "o",
	WINDOW_OPTION = "wo",
	BUFFER_OPTION = "bo",
}

local add_options = function(option_type, id, options)
	if type(id) == "table" then
		options = id
		id = 0
	end

	if type(options) ~= "table" then
		error('options should be a type of "table"')
		return
	end

	for key, value in pairs(options) do
		-- adding options to vim
		-- id condition is there to make it compatible with global options
		-- global options has no id
		-- vim['o']['mouse'] = 4
		-- vim['wo'][10]['number'] = true
		if id == 0 then
			vim[option_type][key] = value
		else
			vim[option_type][id][key] = value
		end
	end
end

local Option = {}

Option.g = function(options)
	add_options(Type.GLOBAL_OPTION, options)
end

Option.w = function(id, options)
	add_options(Type.WINDOW_OPTION, id, options)
end

Option.b = function(id, options)
	add_options(Type.BUFFER_OPTION, id, options)
end

return Option
