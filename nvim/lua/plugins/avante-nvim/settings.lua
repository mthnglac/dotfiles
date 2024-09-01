require("avante").setup({
	---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
	provider = "copilot",
	claude = {
		endpoint = "https://api.anthropic.com",
		model = "claude-3-5-sonnet-20240620",
		temperature = 0,
		max_tokens = 4096,
	},
	mappings = {
		--- @class AvanteConflictMappings
		diff = {
			ours = "co",
			theirs = "ct",
			all_theirs = "ca",
			both = "cb",
			cursor = "cc",
			next = "]x",
			prev = "[x",
		},
		jump = {
			next = "]]",
			prev = "[[",
		},
		submit = {
			normal = "<CR>",
			insert = "<C-s>",
		},
	},
	hints = { enabled = true },
	windows = {
		---@type "right" | "left" | "top" | "bottom"
		position = "right", -- the position of the sidebar
		wrap = true, -- similar to vim.o.wrap
		width = 30, -- default % based on available width
		sidebar_header = {
			align = "center", -- left, center, right for title
			rounded = true,
		},
	},
	highlights = {
		---@type AvanteConflictHighlights
		diff = {
			current = "DiffText",
			incoming = "DiffAdd",
		},
	},
	--- @class AvanteConflictUserConfig
	diff = {
		autojump = true,
		---@type string | fun(): any
		list_opener = "copen",
	},
})
