local lsp = require("lspconfig")
local lsp_signature = require("lsp_signature")
local lsp_signature_settings = require("plugins.lsp-signature-nvim.settings")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local function goto_prev_error()
  vim.diagnostic.goto_prev({ severity = "Error" })
end

local function goto_next_error()
  vim.diagnostic.goto_next({ severity = "Error" })
end

vim.keymap.set("n", "<Space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<Space>q", vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "<Space>g[", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<Space>g]", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<Space>gp", goto_prev_error, opts)
vim.keymap.set("n", "<Space>gn", goto_next_error, opts)

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

  lsp_signature_settings.attach(bufnr)

  vim.keymap.set("n", "<Space>gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<Space>gy", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<Space>gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<Space>gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<Space>gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<Space>rr", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<Space>f", async_buf_formatting, { noremap = true, silent = false, buffer = bufnr })
  vim.keymap.set("n", "<Space>ai", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("i", "<C-k>", function()
    lsp_signature.toggle_float_win()
  end, bufopts)

  vim.keymap.set("n", "<Space>sh", function()
    lsp_signature.toggle_float_win()
  end, bufopts)
end

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)
local servers = { "ts_ls", "html", "jsonls", "gopls", "pyright", "lua_ls" }
for _, server in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if server == "lua_ls" then
    config.settings = {
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
    }
  end
  lsp[server].setup(config)
end
