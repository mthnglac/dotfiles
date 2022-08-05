-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "clangd", "rust_analyzer", "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	})
end

-- nvim-cmp setup
local cmp = require("cmp")
local WIDE_HEIGHT = 20

cmp.setup({
	experimental = { ghost_text = true },
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{
			name = "nvim_lsp_signature_help",
			priority = 100,
			group_index = 1,
		},
		{
			name = "nvim_lsp",
			priority = 100,
			group_index = 1,
		},
		{
			name = "buffer",
			priority = 80,
			autocomplete = false,
			group_index = 3,
		},
		{
			name = "path",
			priority = 80,
			group_index = 3,
		},
	},
	confirmation = {
		default_behavior = cmp.ConfirmBehavior.Replace,
	},
	preselect = false,
	window = {
		documentation = {
			border = {
				"╭",
				"─",
				"╮",
				"│",
				"╯",
				"─",
				"╰",
				"│",
			},
			winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
			maxwidth = math.floor(WIDE_HEIGHT * (vim.o.columns / 100)),
			maxheight = math.floor(WIDE_HEIGHT * (vim.o.lines / 100)),
		},
	},
})
