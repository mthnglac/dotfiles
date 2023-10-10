require("ibl").setup({
	debounce = 100,
	indent = { char = "|" },
	whitespace = { highlight = { "Whitespace", "NonText" } },
	scope = { exclude = { language = { "lua" } } },
})
-- require("ibl").setup({
-- 	char_list = { "│", "¦", "┆", "┊" },
-- 	buftype_exclude = { "terminal" },
-- 	show_current_context = "v:true",
-- 	use_treesitter = "v:true",
-- })


