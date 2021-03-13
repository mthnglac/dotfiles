Command.cmd({
    -- tab confs
    'autocmd FileType python set sw=4',
    'autocmd FileType python set ts=4',
    'autocmd FileType python set sts=4',
})

Augroup.cmds({
    -- highlight on yank!!!
    highlight_yank = {
        {"TextYankPost", "* silent! lua require'vim.highlight'.on_yank({timeout = 400})"};
    };
    -- its PROPERTY!!!
    MTHNGLAC = {
        {"BufWritePre", "* :call TrimWhitespace()"};
    };
})
