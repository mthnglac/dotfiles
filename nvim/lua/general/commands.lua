Command.cmd({
    'syntax on',
    'filetype on',
    'filetype plugin on',
    'filetype indent on',
    -- tab confs
    'autocmd FileType python setlocal sw=4',
    'autocmd FileType python setlocal ts=4',
    'autocmd FileType python setlocal sts=4',
})

--Augroup.cmds({
    --MTHNGLAC = {
        ----{"BufWritePre", "* :call TrimWhitespace()"},
    --},
--})

-- highlight on yank!!!
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = "*",
  callback = function() require("vim.highlight").on_yank({ timeout = 400 }) end
})
