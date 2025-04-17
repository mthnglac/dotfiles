-- highlight on yank!!!
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    require("vim.hl").on_yank({ higroup = "Visual", timeout = 400 })
  end,
})

-- console.log current word in JS, JSX, TS, TSX
-- Ex: console.log('foo', foo)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript, javascriptreact, typescript, typescriptreact",
  callback = function()
    Keybind.g({
      { "n", "<Space>cl", [["ayiwoconsole.log('<C-R>a:', <C-R>a);<Esc>]], { noremap = true, silent = true } },
      { "x", "<Space>cl", [["ayoconsole.log('<C-R>a:', <C-R>a);<Esc>]],   { noremap = true, silent = true } },
    })
  end,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   group = vim.api.nvim_create_augroup("DiffColors", { clear = true }),
--   callback = function()
--     local is_dark = vim.o.background == "dark"
--
--     if is_dark then
--       vim.api.nvim_set_hl(0, "DiffAdd", { fg = "none", bg = "#2e4b2e", bold = true })
--       vim.api.nvim_set_hl(0, "DiffDelete", { fg = "none", bg = "#4c1e15", bold = true })
--       vim.api.nvim_set_hl(0, "DiffChange", { fg = "none", bg = "#45565c", bold = true })
--       vim.api.nvim_set_hl(0, "DiffText", { fg = "none", bg = "#996d74", bold = true })
--     else
--       vim.api.nvim_set_hl(0, "DiffAdd", { fg = "none", bg = "palegreen", bold = true })
--       vim.api.nvim_set_hl(0, "DiffDelete", { fg = "none", bg = "tomato", bold = true })
--       vim.api.nvim_set_hl(0, "DiffChange", { fg = "none", bg = "lightblue", bold = true })
--       vim.api.nvim_set_hl(0, "DiffText", { fg = "none", bg = "lightpink", bold = true })
--     end
--   end,
-- })
