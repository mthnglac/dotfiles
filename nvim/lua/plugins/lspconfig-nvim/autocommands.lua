-- LSP General Attachments
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		-- local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		-- Enable omnifunc LSP completion
		vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = args.buf })

		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		-- if client:supports_method("textDocument/completion") then
		--   -- Optional: trigger autocompletion on EVERY keypress. May be slow!
		--   -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
		--   -- client.server_capabilities.completionProvider.triggerCharacters = chars
		--
		--   vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		-- end
	end,
})

-- Highlighting references and symbol under cursor
vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
	callback = vim.lsp.buf.document_highlight,
	buffer = vim.api.nvim_get_current_buf(),
	group = "lsp_document_highlight",
})
vim.api.nvim_create_autocmd("CursorMoved", {
	callback = vim.lsp.buf.clear_references,
	buffer = vim.api.nvim_get_current_buf(),
	group = "lsp_document_highlight",
})
