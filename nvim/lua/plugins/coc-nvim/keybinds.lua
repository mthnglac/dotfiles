-- GoTo code navigation.
Keybind.g({
	{ 'n', '<Leader>gd', [[<Plug>(coc-definition)]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gy', [[<Plug>(coc-type-definition)]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gi', [[<Plug>(coc-implementation)]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gr', [[<Plug>(coc-references)]], { noremap = false, silent = true } },
	{ 'n', '<Leader>rr', [[<Plug>(coc-rename)]], { noremap = false, silent = false } },
	{ 'n', '<Leader>g[', [[<Plug>(coc-diagnostic-prev)]], { noremap = false, silent = true } },
	{ 'n', '<Leader>g]', [[<Plug>(coc-diagnostic-next)]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gp', [[<Plug>(coc-diagnostic-prev-error)]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gn', [[<Plug>(coc-diagnostic-next-error)]], { noremap = false, silent = true } },
})

-- restart CoC
Keybind.g({
	{ 'n', '<Leader>cr', [[<Cmd>CocRestart<CR>]], { noremap = true, silent = false } },
})

-- search by selected word with CoC
Keybind.g({
	{ 'n', '<Leader>py', [[<Plug>(coc-format-selected)<CR>]], { noremap = false, silent = false } },
	{ 'v', '<Leader>py', [[<Plug>(coc-format-selected)<CR>]], { noremap = false, silent = false } },
})

-- search by selected word with CoC
Keybind.g({
	{ 'n', '<Leader>prw', [[<Cmd>CocSearch <C-R>=expand("<cword>")<CR><CR>]], { noremap = true, silent = false } },
})

---- mappins for CocList
Keybind.g({
	-- show all diagnostics
	{ 'n', '<Leader>ca', [[<Cmd>CocList diagnostics<CR>]], { noremap = true, silent = true, nowait = true } },
})

---- others
Keybind.g({
	-- for jump with tab
	{ 'i', '<TAB>', [[v:lua.coc_smart_tab()]], { noremap = true, silent = true, expr = true } },
	-- for choose with tab through autocomplete menu
	{ 'i', '<S-TAB>', [[v:lua.coc_autocomplete_through()]], { noremap = true, silent = false, expr = true } },
})
