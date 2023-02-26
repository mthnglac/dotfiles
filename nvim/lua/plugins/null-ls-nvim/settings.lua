local null_ls = require("null-ls")

null_ls.setup({
	sources = {
    -- Linter
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.flake8,
    -- Formatter
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.rustfmt,
	},
})
