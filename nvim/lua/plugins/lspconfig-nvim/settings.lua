local keybinds = require("plugins.lspconfig-nvim.keybinds")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "ts_ls", "html", "jsonls", "gopls", "pyright", "lua_ls", "cssls", "ruby_lsp", "sqlls" }

vim.diagnostic.config({
	virtual_text = {
		severity = nil,
		source = "if_many",
		format = nil,
		prefix = "●",
		spacing = 4,
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

for _, server_name in ipairs(servers) do
	local config = {
		on_attach = keybinds.on_attach,
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
	vim.lsp.enable(server_name)
end
