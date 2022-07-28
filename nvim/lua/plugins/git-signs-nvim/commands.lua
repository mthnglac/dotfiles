vim.api.nvim_create_user_command("BlameCurrentLine", function()
  require("gitsigns").toggle_current_line_blame()
end, { nargs = 0 })
