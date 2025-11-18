local keybinds = require("plugins.lspconfig-nvim.keybinds")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "ts_ls", "html", "jsonls", "gopls", "pyright", "lua_ls", "cssls", "ruby_lsp", "sqlls" }

vim.diagnostic.config({
	virtual_lines = true,
	-- virtual_text = {
	-- 	severity = nil,
	-- 	source = "if_many",
	-- 	format = nil,
	-- 	prefix = "●",
	-- 	spacing = 4,
	-- },
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

vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
	if err or not (result and result.contents) then
		return
	end

	local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	lines = vim.lsp.util.trim_empty_lines(lines)
	if vim.tbl_isempty(lines) then
		return
	end

	local width = 0
	local max_width = 80
	local min_width = 20
	for _, line in ipairs(lines) do
		local line_width = vim.fn.strdisplaywidth(line)
		if line_width > width then
			width = line_width
		end
	end
	width = math.min(math.max(width, min_width), max_width)

	local height = math.min(#lines, 30) -- max 30 satır yükseklik

	local opts = {
		max_width = max_width,
		max_height = 30,
		width = width,
		height = height,
		focusable = false,
		winblend = 10,
		close_events = { "BufLeave", "CursorMoved", "InsertCharPre" },
		winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
	}

	vim.lsp.util.open_floating_preview(lines, "markdown", opts)
end

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
				hint = { enable = true },
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim" } },
				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			},
		}
	elseif server_name == "ruby_lsp" then
		config.capabilities = {
      general = {
        positionEncodings = { "utf-16" },
      }
    }
	end

	vim.lsp.config(server_name, config)
	vim.lsp.enable(server_name)
end
