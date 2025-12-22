local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Diagnostics
    null_ls.builtins.diagnostics.rubocop,

    -- Linters

    -- Formatters
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.sql_formatter,
    null_ls.builtins.formatting.erb_format,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.shfmt,
  },
})
