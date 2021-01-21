" search entered word within project
nnoremap <leader>ps :Rg<SPACE>
" search by selected word
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" search by filename in git files
nnoremap <C-p> :GFiles<CR>
" buffer list window
nnoremap <leader>b :Buffers<CR>
" search by filename in all project files
nnoremap <leader>pf :Files<CR>
