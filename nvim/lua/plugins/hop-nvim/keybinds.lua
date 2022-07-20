Keybind.g({
	{
		"",
		"f",
		[[<cmd>lua require('hop').hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>]],
		{ noremap = false, silent = true },
	},
	{
		"",
		"F",
		[[<cmd>lua require('hop').hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>]],
		{ noremap = false, silent = true },
	},
	{
		"",
		"t",
		[[<cmd>lua require('hop').hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>]],
		{ noremap = false, silent = true },
	},
	{
		"",
		"T",
		[[<cmd>lua require('hop').hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>]],
		{ noremap = false, silent = true },
	},

	{ "n", "<Leader>phc", [[<cmd>lua require('hop').hint_words()<cr>]], { noremap = true, silent = true } },
	{ "n", "<Leader>phw", [[<cmd>lua require('hop').hint_words({ multi_windows = true })<cr>]], { noremap = true, silent = true } },
})
