-- open terminal on ctrl+n
vim.api.nvim_exec(
[[
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
]], true)

-- clear all registers
vim.api.nvim_exec(
[[
fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun
]], true)

-- removes any extraneous whitespace at the end of the lines
vim.api.nvim_exec(
[[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]], true)

vim.api.nvim_exec(
[[
fun! RunTest()
  let lineNumber = line('.')

  while lineNumber > 0
    let test = matchlist(getline(lineNumber), '^test \(.*\), ->$')
    if len(test) > 0
      exe "!ember test --filter ".substitute(test[1], '"', '\\"', 'g')
    else
      let lineNumber -= 1
    endif
  endwhile
endfun
]], true)
