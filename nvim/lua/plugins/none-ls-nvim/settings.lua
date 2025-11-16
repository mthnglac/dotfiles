local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Linter
    -- ...

    -- Formatter
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.sql_formatter,
  },
})
