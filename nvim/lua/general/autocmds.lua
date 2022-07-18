-- highlight on yank!!!
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({ timeout = 400 })
	end,
})

--local groupCursorEffect = vim.api.nvim_create_augroup("HighlighMyCursor", { clear = true })
--vim.api.nvim_create_autocmd({'WinEnter,BufWinEnter,VimEnter'},
--{
--pattern = "*",
--callback = function()
--vim.wo.cursorline = true
--vim.wo.cursorcolumn = true
--end,
--group = groupCursorEffect
--}
--)
--vim.api.nvim_create_autocmd('WinLeave',
--{
--pattern = "*",
--callback = function()
--vim.wo.cursorline = false
--vim.wo.cursorcolumn = false
--end,
--group = groupCursorEffect
--}
--)
