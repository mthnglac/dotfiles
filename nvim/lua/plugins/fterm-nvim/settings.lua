require('FTerm').setup({
  dimensions  = {
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5
  },
  border = 'double'
})

-- Keybinding
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Closer to the metal
map('n', '<F12>', '<Cmd>lua require("FTerm").toggle()<CR>', opts)
map('t', '<F12>', '<C-\\><C-n><Cmd>lua require("FTerm").toggle()<CR>', opts)
