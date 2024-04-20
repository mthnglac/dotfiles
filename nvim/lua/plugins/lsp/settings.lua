local lsp = require("lspconfig")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local function goto_prev_error()
  vim.diagnostic.goto_prev({ severity = "Error" })
end

local function goto_next_error()
  vim.diagnostic.goto_next({ severity = "Error" })
end

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "<space>g[", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<space>g]", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>gp", goto_prev_error, opts)
vim.keymap.set("n", "<space>gn", goto_next_error, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local function async_buf_formatting()
    vim.lsp.buf.format({ async = true })
  end

  vim.keymap.set("n", "<space>gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<space>gy", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<space>gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>rr", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>f", async_buf_formatting, { noremap = true, silent = false, buffer = bufnr })
end

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)
lsp.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})
