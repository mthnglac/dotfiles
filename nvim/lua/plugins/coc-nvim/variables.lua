Variable.g({
    coc_global_extensions = {
        "coc-clangd",
        "coc-css",
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
        "coc-lua",
        "coc-marketplace",
        "coc-python",
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
    coc_node_path = tostring(os.getenv("HOME")) .. "/.nvm/versions/node/v12.18.4/bin/node",
    -- for jump to next placeholder
    coc_snippet_next = '<c-j>',
    -- for jump to next placeholder
    coc_snippet_prev = '<c-k>',
})
