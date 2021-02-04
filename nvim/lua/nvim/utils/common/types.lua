-- Common module define reusable functions
-- @module Common
local Types = {}

-- check passed value is a table
--
-- @param arg value that needs to be checked
function Types:is_table (arg)
	if type(arg) == 'table' then
		return true
	else
		return false
	end
end

return Types
