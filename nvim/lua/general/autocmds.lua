-- highlight on yank!!!
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    require("vim.highlight").on_yank({ timeout = 400 })
  end,
})

-- console.log current word in JS, JSX, TS, TSX
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript, javascriptreact, typescript, typescriptreact",
  callback = function()
    Keybind.g({
      { "n", "<Leader>cl", [["ayiwoconsole.log('<C-R>a:', <C-R>a);<Esc>]], { noremap = true, silent = true } },
      { "x", "<Leader>cl", [["ayoconsole.log('<C-R>a:', <C-R>a);<Esc>]], { noremap = true, silent = true } },
    })
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
