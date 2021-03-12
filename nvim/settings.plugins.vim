" tab confs ------------------------------------------------------------------
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


if executable('rg')
    let g:rg_derive_root='true'
endif


let loaded_matchparen = 1
let mapleader = " "


" clear all registers --------------------------------------------------------
fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun


" removes any extraneous whitespace at the end of the lines ------------------
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


" YES ------------------------------------------------------------------------
com! W w


" highlight on yank!!! -------------------------------------------------------
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 400})
augroup END


" its PROPERTY!!! ------------------------------------------------------------
augroup MTHNGLAC
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END


" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

function! RunTest()
  let lineNumber = line('.')

  while lineNumber > 0
    let test = matchlist(getline(lineNumber), '^test \(.*\), ->$')
    if len(test) > 0
      exe "!ember test --filter ".substitute(test[1], '"', '\\"', 'g')
    else
      let lineNumber -= 1
    endif
  endwhile
endfunction
