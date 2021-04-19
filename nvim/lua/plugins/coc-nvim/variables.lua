Variable.g({
    coc_global_extensions = {
        "coc-clangd",
        "coc-css",
        "coc-deno",
        "coc-ember",
        "coc-eslint",
        "coc-flutter-tools",
        "coc-go",
        "coc-highlight",
        "coc-html",
        "coc-java",
        "coc-java-debug",
        "coc-jest",
        "coc-json",
        "coc-kotlin",
        "coc-lua",
        "coc-marketplace",
        "coc-python",
        "coc-rls",
        "coc-rust-analyzer",
        "coc-snippets",
        "coc-solargraph",
        "coc-sql",
        "coc-tsserver",
        "coc-vetur",
        "coc-vimlsp",
        "coc-xml",
    }
})

Variable.g({
    -- node path
    coc_node_path = tostring(os.getenv("HOME")) .. "/.nvm/versions/node/v15.14.0/bin/node",
    -- for jump to next placeholder
    coc_snippet_next = '<c-j>',
    -- for jump to next placeholder
    coc_snippet_prev = '<c-k>',
})
