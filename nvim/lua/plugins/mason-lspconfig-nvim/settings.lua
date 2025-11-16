local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local servers = { "ts_ls", "html", "jsonls", "gopls", "pyright", "lua_ls", "cssls", "ruby_lsp", "sqlls" }

mason.setup({})

vim.diagnostic.config({
	virtual_text = {
		severity = nil, -- Show all severities
		source = "if_many", -- Show source if multiple sources
		format = nil,
		prefix = "●", -- Icon prefix for virtual text
		spacing = 4, -- Space between virtual text and code
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

local opts = { noremap = true, silent = true }
local function goto_prev_error()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = -1 })
end
local function goto_next_error()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = 1 })
end
local function goto_prev_warn()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = -1 })
end
local function goto_next_warn()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = 1 })
end
vim.keymap.set("n", "<Space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<Space>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<Space>g[", goto_prev_warn, opts)
vim.keymap.set("n", "<Space>g]", goto_next_warn, opts)
vim.keymap.set("n", "<Space>gp", goto_prev_error, opts)
vim.keymap.set("n", "<Space>gn", goto_next_error, opts)
vim.keymap.set("n", "<Space>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local function async_buf_formatting()
		vim.lsp.buf.format({ async = true })
	end

	vim.keymap.set("n", "<Space>gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<Space>gy", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<Space>gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "<Space>gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<Space>gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<Space>rr", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<Space>f", async_buf_formatting, { noremap = true, silent = false, buffer = bufnr })
	vim.keymap.set("n", "<Space>ai", vim.lsp.buf.code_action, bufopts)
end

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local capabilities =
	vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), cmp_nvim_lsp.default_capabilities())

for _, server_name in ipairs(servers) do
	local config = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server_name == "ts_ls" then
		config.settings = {
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
		}
	elseif server_name == "lua_ls" then
		config.settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim" } },
				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			},
		}
	end

	vim.lsp.config(server_name, config)
end
