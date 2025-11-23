Keybind.g({
  --[[
	#-------------------------------------------------------------------------#
	#                                    CONFIG                               #
	#-------------------------------------------------------------------------#
	--]]
  -- reload nvim configuration file
  {
    "n",
    "<Space><CR>",
    ":luafile $MYVIMRC<CR>",
    { noremap = true, desc = "General: Reload neovim conf" },
  },

  --[[
	#-------------------------------------------------------------------------#
	#                                  CURSOR MOVE                            #
	#-------------------------------------------------------------------------#
	--]]
  {
    "n",
    "<Space>h",
    "<Cmd>wincmd h<CR>",
    { noremap = true, desc = "General: Move cursor to the left window" },
  },
  {
    "n",
    "<Space>j",
    "<Cmd>wincmd j<CR>",
    { noremap = true, desc = "General: Move cursor to the bottom window" },
  },
  {
    "n",
    "<Space>k",
    "<Cmd>wincmd k<CR>",
    { noremap = true, desc = "General: Move cursor to the top window" },
  },
  {
    "n",
    "<Space>l",
    "<Cmd>wincmd l<CR>",
    { noremap = true, desc = "General: Move cursor to the right window" },
  },
  {
    "n",
    "<Space>z",
    [[<Cmd>set cursorline! cursorcolumn!<CR>]],
    { noremap = true, desc = "General: Toggle highlighting the cursorline" },
  },

  --[[
	#-------------------------------------------------------------------------#
	#                                CUT COPY PASTE                           #
	#-------------------------------------------------------------------------#
	--]]
  -- (╯°□°）╯︵ ┻━┻
  {
    "v",
    "X",
    '"_d',
    { noremap = true, desc = "General: Delete without registering word" },
  },
  {
    "v",
    "<Space>p",
    '"_dP',
    { noremap = true, desc = "General: Delete and local-paste without registering" },
  },
  {
    "n",
    "<Space>y",
    '"+y',
    { noremap = true, desc = "General: Yank it to global register" },
  },
  {
    "v",
    "<Space>y",
    '"+y',
    { noremap = true, desc = "General: Yank it to global register" },
  },
  -- ????????
  { "n", "<Space>d", '"_d', { noremap = true } },
  { "v", "<Space>d", '"_d', { noremap = true } },
  -- (╯°□°）╯︵ ┻━┻
  {
    "n",
    "<Space>Y",
    'gg"+yG',
    { noremap = true, desc = "General: Yank all the content of file to global register" },
  },
  {
    "n",
    "Y",
    "yg$",
    { noremap = true, desc = "General: Yank from the cursor position to the end of the line" },
  },
  {
    "n",
    "gp",
    "`[v`]",
    { noremap = true, desc = "General: Reselect last pasted text" },
  },

  --[[
	#-------------------------------------------------------------------------#
	#                                RESIZE WINDOW                            #
	#-------------------------------------------------------------------------#
	--]]
  {
    "n",
    "<Space>+",
    "<Cmd>vertical resize +5<CR>",
    { noremap = true, desc = "General: Increase window width +5" },
  },
  {
    "n",
    "<Space>-",
    "<Cmd>vertical resize -5<CR>",
    { noremap = true, desc = "General: Increase window width -5" },
  },
  {
    "n",
    "<Space>rp",
    "<Cmd>resize 100<CR>",
    { noremap = true, desc = "General: Increase window height +100" },
  },

  --[[
	#-------------------------------------------------------------------------#
	#                            JUMP LIST MUTATIONS                          #
	#-------------------------------------------------------------------------#
	--]]
  {
    "n",
    "j",
    [[(v:count > 1 ? "m'" . v:count : '') . 'j']],
    { expr = true, noremap = true, desc = "General: Jump list mutations" },
  },
  {
    "n",
    "k",
    [[(v:count > 1 ? "m'" . v:count : '') . 'k']],
    { expr = true, noremap = true, desc = "General: Jump list mutations" },
  },

  --[[
	#-------------------------------------------------------------------------#
	#                                MOVE LINE                                #
	#-------------------------------------------------------------------------#
	--]]
  {
    "v",
    "J",
    [[:m '>+1<CR>gv=gv]],
    { noremap = true, desc = "General: Move selected line to up" },
  },
  {
    "v",
    "K",
    [[:m '<-2<CR>gv=gv]],
    { noremap = true, desc = "General: Move selected line to down" },
  },
  {
    "n",
    "J",
    [[mzJ`z]],
    { noremap = true, desc = "General: Append the bottom line to the current line" },
  },

  --[[
	#-------------------------------------------------------------------------#
	#                                   UNDO                                  #
	#-------------------------------------------------------------------------#
	--]]
  { "i", ",", ",<c-g>u", { noremap = true, desc = "General: Undo break points" } },
  { "i", ".", ".<c-g>u", { noremap = true, desc = "General: Undo break points" } },
  { "i", "!", "!<c-g>u", { noremap = true, desc = "General: Undo break points" } },
  { "i", "?", "?<c-g>u", { noremap = true, desc = "General: Undo break points" } },

  --[[
	#-------------------------------------------------------------------------#
	#                                SEARCH WORD                              #
	#-------------------------------------------------------------------------#
	--]]
  { "n", "n", "nzzzv",   { noremap = true, desc = "General: Search with next with centralized cursor" } },
  { "n", "N", "Nzzzv",   { noremap = true, desc = "General: Search with next with centralized cursor" } },

  --[[
	#-------------------------------------------------------------------------#
	#                                 TERMINAL                                #
	#-------------------------------------------------------------------------#
	--]]
  {
    "n",
    "<Space>\\t",
    "<Cmd>terminal<CR>",
    { noremap = true, desc = "General: Open terminal" },
  },
  {
    "t",
    "<Esc>",
    "<C-\\><C-n>",
    { noremap = true, desc = "General: Turn terminal to normal mode with escape" },
  },
  {
    "n",
    "<c-n>",
    "<Cmd>call OpenTerminal()<CR>",
    { noremap = true, desc = "General: Open neovim terminal" },
  },

  --[[
	#-------------------------------------------------------------------------#
	#                                   COMPLETION                            #
	#-------------------------------------------------------------------------#
	--]]
  -- {
  --   "i",
  --   "<Tab>",
  --   'pumvisible() ? "\\<C-n>" : "\\<Tab>"',
  --   { expr = true, silent = true, desc = "Tab: Next completion or tab" },
  -- },
  -- {
  --   "i",
  --   "<S-Tab>",
  --   'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"',
  --   { expr = true, silent = true, desc = "Tab: Prev completion or shift-tab" },
  -- },
  -- {
  --   "i",
  --   "<C-Space>",
  --   "<C-x><C-o>",
  --   { noremap = true, desc = "Trigger omni completion" },
  -- },

  --[[
	#-------------------------------------------------------------------------#
	#                                   OTHER                                 #
	#-------------------------------------------------------------------------#
	--]]
  {
    "n",
    "<Space>",
    "<Cmd>nohlsearch<Bar>:echo<CR>",
    { noremap = true, silent = true, desc = "General: Hit twice the spacebar if you want highlight to gone!" },
  },
  { "i", "<C-c>", "<esc>", { noremap = true, desc = "General: ctrl-c" } },
})
