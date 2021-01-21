nmap <leader>gs :G<CR>
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

" when solving conflicts
" take from left
nmap <leader>gf :diffget //2<CR>
" take from right
nmap <leader>gj :diffget //3<CR>
