local lsp = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Initialize mason
mason.setup({})

-- Initialize mason-lspconfig
mason_lspconfig.setup({
  ensure_installed = { "ts_ls", "html", "jsonls", "gopls", "pyright", "lua_ls", "cssls" },
  automatic_installation = true,
})

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
vim.keymap.set("n", "<Space>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, opts)

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

  vim.keymap.set("n", "<Space>gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<Space>gy", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<Space>gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<Space>gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<Space>gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<Space>rr", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<Space>f", async_buf_formatting, { noremap = true, silent = false, buffer = bufnr })
  vim.keymap.set("n", "<Space>ai", vim.lsp.buf.code_action, bufopts)
end

-- LSP Server setup using mason-lspconfig
local servers = { "ts_ls", "html", "jsonls", "gopls", "pyright", "lua_ls", "cssls" } -- Corrected server names for mason

for _, server in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    ),
  }

  if server == "ts_ls" then
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
        }
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
        }
      },
    }
  end

  if server == "lua_ls" then
    config.settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      },
    }
  end

  -- Use mason_lspconfig.setup_handlers to configure each server
  mason_lspconfig.setup_handlers({
    function(server_name)
      lsp[server_name].setup(config)
    end,
  })

  -- Call setup for the current server
  lsp[server].setup(config)
end
