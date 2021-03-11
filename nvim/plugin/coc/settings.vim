" CoC.nvim confs -------------------------------------------------------------

" node path
let g:coc_node_path = '$HOME/.nvm/versions/node/v12.18.4/bin/node'
" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



" CoC-highlight confs --------------------------------------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')



" CoC-Snippets confs ---------------------------------------------------------

" for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" for jump with tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"" for choose with tab through autocomplete menu
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
