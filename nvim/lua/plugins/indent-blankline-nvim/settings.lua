require("indent_blankline").setup({
    char_list = {'│', '¦', '┆', '┊'},
    buftype_exclude = {"terminal"},
    show_current_context = 'v:true',
    use_treesitter = 'v:true',
})
