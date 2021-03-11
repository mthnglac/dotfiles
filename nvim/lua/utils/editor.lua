local v = vim.api
local Editor = {}

Editor.get_curr_char = function ()
   local byte_index = v.nvim_win_get_cursor(0)[2]
   return v.nvim_get_current_line():sub(byte_index, byte_index)
end

Editor.is_curr_char_space = function ()
   return string.find(Editor.get_curr_char(), '%s') ~= nil
end

return Editor
