local cl = vim.o.columns
local ln = vim.o.lines
local width = 0.8
local height = 0.8

require("toggleterm").setup({
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = math.ceil(cl * width),
    height = math.ceil(ln * height - 4),
    winblend = 3,
  }
})
