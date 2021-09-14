Variable.g({
    coc_global_extensions = {
        "coc-clangd",
        "coc-css",
        "coc-db",
        "coc-ember",
        "coc-eslint",
        "coc-flutter-tools",
        "coc-go",
        "coc-html",
        "coc-java",
        "coc-java-debug",
        "coc-jest",
        "coc-pyright",
        "coc-sumneko-lua",
        "coc-marketplace",
        "coc-jedi",
        "coc-rls",
        "coc-rust-analyzer",
        "coc-solargraph",
        "coc-tsserver",
        "coc-vetur",
        "coc-vimlsp",
    }
})

Variable.g({
    coc_node_path = tostring(os.getenv("HOME")) .. "/.asdf/installs/nodejs/14.16.1/bin/node",
    -- for jump to next placeholder
    coc_snippet_next = '<c-j>',
    -- for jump to next placeholder
    coc_snippet_prev = '<c-k>',
})
