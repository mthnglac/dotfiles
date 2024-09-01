-- clear all registers
vim.api.nvim_exec2(
	[[
    fun! EmptyRegisters()
      let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
      for r in regs
        call setreg(r, [])
      endfor
    endfun
  ]],
	{ output = true }
)

-- removes any extraneous whitespace at the end of the lines
vim.api.nvim_exec2(
	[[
    fun! TrimWhitespace()
      let l:save = winsaveview()
      keeppatterns %s/\s\+$//e
      call winrestview(l:save)
    endfun
  ]],
	{ output = true }
)
