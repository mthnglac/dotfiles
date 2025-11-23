local M = {}
local opts = { noremap = true, silent = true }
local telescope_builtin = require("telescope.builtin")

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
local function inlay_hint()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

vim.keymap.set("n", "<Space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<Space>q", telescope_builtin.diagnostics, opts)
vim.keymap.set("n", "<Space>g[", goto_prev_warn, opts)
vim.keymap.set("n", "<Space>g]", goto_next_warn, opts)
vim.keymap.set("n", "<Space>gp", goto_prev_error, opts)
vim.keymap.set("n", "<Space>gn", goto_next_error, opts)
vim.keymap.set("n", "<Space>ih", inlay_hint, opts)

-- LSP buffer local keymaps
-- @param client table The LSP client object
-- @param bufnr number The buffer number
function M.on_attach(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local function async_buf_formatting()
    vim.lsp.buf.format({ async = true })
  end

  vim.keymap.set("n", "<C-]>", telescope_builtin.lsp_definitions, bufopts)
  vim.keymap.set("n", "grt", telescope_builtin.lsp_type_definitions, bufopts)
  vim.keymap.set("n", "gri", telescope_builtin.lsp_implementations, bufopts)
  vim.keymap.set("n", "grr", telescope_builtin.lsp_references, bufopts)
  vim.keymap.set("n", "<Space>f", async_buf_formatting, { noremap = true, silent = false, buffer = bufnr })
end

return M
