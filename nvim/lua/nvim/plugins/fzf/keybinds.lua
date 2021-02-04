Keybind.g({
  -- search entered word within project
	{ 'n', '<leader>ps', '<cmd>Rg<cr>', { noremap = true } },
  -- search by selected word
	--{ 'n', '<leader>pw', '<cmd>Rg<cr>', { noremap = true } },
  -- search by filename in git files
	{ 'n', '<leader>', '<cmd>GFiles<cr>', { noremap = true } },
  -- buffer list window
	{ 'n', '<leader>b', '<cmd>Buffers<cr>', { noremap = true } },
  -- search by filename in all project files
	{ 'n', '<leader>pf', '<cmd>Files<cr>', { noremap = true } },
})
