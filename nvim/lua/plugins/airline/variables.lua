Variable.g({
	airline_theme = "luna",
	airline_powerline_fonts = 1,
	airline_highlighting_cache = 1,
})

vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = "unique_tail"

-- for coc extension
vim.g["airline#extensions#coc#enabled"] = 1
vim.g["airline#extensions#coc#error_symbol"] = "E:"
vim.g["airline#extensions#coc#warning_symbol"] = "W:"
vim.g["airline#extensions#coc#show_coc_status"] = 1

