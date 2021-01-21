" open help for selected word
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
" source %
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
" resize window
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
" move selected line to up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" what in the hell ?????  (╯°□°）╯︵ ┻━┻
" delete without registering word
vnoremap X "_d
" delete&local-paste without registering
vnoremap <leader>p "_dP
" yank it to global register
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" yank all the content of file to global register
nnoremap <leader>Y gg"+yG
" navigation between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" hit twice the spacebar if you want highlight to gone!
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" ctrl-c
inoremap <C-c> <esc>

" TERMINAL ---------------------------------------------------------------
" open terminal
nnoremap <leader>\t :terminal<CR>
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
" open neovim terminal
nnoremap <c-n> :call OpenTerminal()<CR>
