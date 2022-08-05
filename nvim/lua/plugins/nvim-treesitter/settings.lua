require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<S-Tab>", --normal mode
			node_incremental = "<Tab>", --visual mode
			node_decremental = "<S-Tab>", --visual mode
		},
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		config = {
			javascriptreact = { style_element = "{/*%s*/}" },
		},
	},
	pairs = {
		enable = true,
		disable = {},
		highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
		highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
		goto_right_end = false, -- whether to go to the end of the right partner or the beginning
		fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
		keymaps = nil,
		delete_balanced = {
			only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
			fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
			longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
			-- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
		},
	},
})
