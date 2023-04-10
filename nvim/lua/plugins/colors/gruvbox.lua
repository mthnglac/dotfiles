require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		operators = true,
		comments = true,
	},
	inverse = true, -- invert background for search, diffs, statuslines and errors
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	contrast = "hard", -- can be "hard" or "soft"
	overrides = {
		Normal = { bg = "#000000" },
	},
})
vim.api.nvim_command([[colorscheme gruvbox]])
