require("gruvbox").setup({
	terminal_colors = true,
	undercurl = true,
	underline = true,
	bold = false,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = true,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard" or "soft"
	palette_overrides = {},
	overrides = {
		-- Normal = { bg = "#000000" },
	},
	dim_inactive = false,
	transparent_mode = false,
})
-- vim.o.background = "dark"
-- vim.api.nvim_command([[colorscheme gruvbox]])
