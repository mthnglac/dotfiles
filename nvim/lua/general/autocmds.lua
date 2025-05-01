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
			{ "x", "<Space>cl", [["ayoconsole.log('<C-R>a:', <C-R>a);<Esc>]], { noremap = true, silent = true } },
		})
	end,
})
