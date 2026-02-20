require("nvim-treesitter.config").setup({
  ensure_installed = { "go", "html", "json", "typescript", "lua", "python", "regex", "bash" },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<S-Tab>", --normal mode
      node_incremental = "<Tab>", --visual mode
      node_decremental = "<S-Tab>", --visual mode
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
      },
    },
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    config = {
      javascriptreact = { style_element = "{/*%s*/}" },
    },
  },
})

vim.treesitter.language.register("markdown", "octo")
