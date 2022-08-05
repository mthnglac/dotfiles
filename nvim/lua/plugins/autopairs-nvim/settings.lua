local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")
local ts_conds = require("nvim-autopairs.ts-conds")

npairs.setup({
	disable_filetype = { "TelescopePrompt" },
	disable_in_macro = false, -- disable when recording or executing a macro
	disable_in_visualblock = false, -- disable when insert after visual block mode
	ignored_next_char = [=[[%w%%%'%[%"%.]]=],
	enable_moveright = true,
	enable_afterquote = true, -- add bracket pairs after quote
	enable_check_bracket_line = true, --- check bracket in same line
	enable_bracket_in_quote = true, --
	break_undo = true, -- switch for basic rule break undo sequence
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add a pair on that treesitter node
		javascript = { "template_string" },
		java = false, -- don't check treesitter on java
	},
	map_cr = true,
	map_bs = true, -- map the <BS> key
	map_c_h = false, -- Map the <C-h> key to delete a pair
	map_c_w = false, -- map <c-w> to delete a pair if possible
})

npairs.add_rules({
	-- treesitter rules
	Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
	Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),

	-- add margin after cursor on space
	-- Before: (|)
	-- After: ( | )
	Rule(" ", " ")
		:with_pair(function(opts)
			local pair = opts.line:sub(opts.col - 1, opts.col)
			return vim.tbl_contains({ "()", "{}", "[]" }, pair)
		end)
		:with_move(cond.none())
		:with_cr(cond.none())
		:with_del(function(opts)
			local col = vim.api.nvim_win_get_cursor(0)[2]
			local context = opts.line:sub(col - 1, col + 2)
			return vim.tbl_contains({ "(  )", "{  }", "[  ]" }, context)
		end),
	Rule("", " )")
		:with_pair(cond.none())
		:with_move(function(opts)
			return opts.char == ")"
		end)
		:with_cr(cond.none())
		:with_del(cond.none())
		:use_key(")"),
	Rule("", " }")
		:with_pair(cond.none())
		:with_move(function(opts)
			return opts.char == "}"
		end)
		:with_cr(cond.none())
		:with_del(cond.none())
		:use_key("}"),
	Rule("", " ]")
		:with_pair(cond.none())
		:with_move(function(opts)
			return opts.char == "]"
		end)
		:with_cr(cond.none())
		:with_del(cond.none())
		:use_key("]"),

	-- Add curly braces on arrow on javascript!!
  Rule("%(.*%)%s*%=>$", " {}", { "typescript", "typescriptreact", "javascript", "javascriptreact" })
		:use_regex(true)
		:set_end_pair_length(1),
})
