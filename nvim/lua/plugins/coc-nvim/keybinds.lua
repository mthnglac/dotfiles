-- GoTo code navigation.
Keybind.g({
	{ 'n', '<Leader>gd', [[<Plug>(coc-definition)]], { noremap = false, silent = false } },
	{ 'n', '<Leader>gy', [[<Plug>(coc-type-definition)]], { noremap = false, silent = false } },
	{ 'n', '<Leader>gi', [[<Plug>(coc-implementation)]], { noremap = false, silent = false } },
	{ 'n', '<Leader>gr', [[<Plug>(coc-references)]], { noremap = false, silent = false } },
	{ 'n', '<Leader>rr', [[<Plug>(coc-rename)]], { noremap = false, silent = false } },
	{ 'n', '<Leader>g[', [[<Plug>(coc-diagnostic-prev)]], { noremap = false, silent = false } },
	{ 'n', '<Leader>g]', [[<Plug>(coc-diagnostic-next)]], { noremap = false, silent = false } },
	{ 'n', '<Leader>gp', [[<Plug>(coc-diagnostic-prev-error)]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gn', [[<Plug>(coc-diagnostic-next-error)]], { noremap = false, silent = true } },
})

-- restart CoC
Keybind.g({
	{ 'n', '<Leader>cr', [[<Cmd>CocRestart<CR>]], { noremap = true, silent = false } },
})

-- search by selected word with CoC
Keybind.g({
	{ 'n', '<Leader>prw', [[<Cmd>CocSearch <C-R>=expand("<cword>")<CR><CR>]], { noremap = true, silent = false } },
})

---- others
Keybind.g({
	-- for trigger snippet expand.
	{ 'i', '<C-l>', [[<Plug>(coc-snippets-expand)]], { noremap = false, silent = false } },
	-- for select text for visual placeholder of snippet.
	{ 'v', '<C-j>', [[<Plug>(coc-snippets-select)]], { noremap = false, silent = false } },
	-- for both expand and jump (make expand higher priority.)
	{ 'i', '<C-j>', [[<Plug>(coc-snippets-expand-jump)]], { noremap = false, silent = false } },
	-- for jump with tab
	{ 'i', '<TAB>', [[pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()]], { noremap = true, silent = true, expr = true } },
	-- for choose with tab through autocomplete menu
	{ 'i', '<S-TAB>', [[pumvisible() ? "\<C-p>" : "\<C-h>"]], { noremap = true, silent = false, expr = true } },
})
