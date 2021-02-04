local opt = { noremap = true, expr = true }
local silent_opt = {}

Keybind.g({
	--{ 'i', '<c-j>', '<cmd>lua Coc.go_to_next_completion_item("<c-j>")', opt },
	--{ 'i', '<c-k>', '<cmd>lua Coc.go_to_previous_completion_item("<c-k>")', opt },
	--{ 'i', '<c-space>', [[coc#refresh()]], opt },

	{ 'n', '<leader>g[', '<Plug>(coc-diagnostic-next)', silent_opt },
	{ 'n', '<leader>g]', '<Plug>(coc-diagnostic-prev)', silent_opt },
	{ 'n', '<leader>gp', '<Plug>(coc-diagnostic-next-error)', silent_opt },
	{ 'n', '<leader>gn', '<Plug>(coc-diagnostic-prev-error)', silent_opt },

	{ 'n', 'gd', '<Plug>(coc-definition)', silent_opt },
	{ 'n', 'gi', '<Plug>(coc-implementation)', silent_opt },
	{ 'n', 'gr', '<Plug>(coc-references)', silent_opt },
	{ 'n', 'gt', '<Plug>(coc-type-definition)', silent_opt },
	--{ 'n', 'K', '<cmd>lua Coc.show_documentation()<cr>', silent_opt },

	{ 'n', '<leader>rn', '<Plug>(coc-rename)', silent_opt},
	--{ 'n', '<leader>qf', '<Plug>(coc-fix-current)', silent_opt},
	--{ 'n', '<leader>ac', '<Plug>(coc-codeaction)', silent_opt},
	--{ 'n', '<leader>f', '<cmd>lua Coc.format_code()<cr>', silent_opt},

	--{ 'x', 'if', '<Plug>(coc-funcobj-i)', silent_opt },
	--{ 'o', 'if', '<Plug>(coc-funcobj-i)', silent_opt },
	--{ 'x', 'af', '<Plug>(coc-funcobj-a)', silent_opt },
	--{ 'o', 'af', '<Plug>(coc-funcobj-a)', silent_opt },

	--{ 'x', 'ic', '<Plug>(coc-classobj-i)', silent_opt },
	--{ 'o', 'ic', '<Plug>(coc-classobj-i)', silent_opt },
	--{ 'x', 'ac', '<Plug>(coc-classobj-a)', silent_opt },
	--{ 'o', 'ac', '<Plug>(coc-classobj-a)', silent_opt },
})
