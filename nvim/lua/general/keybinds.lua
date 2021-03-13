Keybind.g({
	--[[
	#-------------------------------------------------------------------------#
	#                                    CONFIG                               #
	#-------------------------------------------------------------------------#
	--]]
    -- reload nvim configuration file
    { 'n', '<Leader><CR>', ':luafile $MYVIMRC<CR>' },


	--[[
	#-------------------------------------------------------------------------#
	#                                  CURSOR MOVE                            #
	#-------------------------------------------------------------------------#
	--]]
    -- [ space + h ] move cursor to left window
    { 'n', '<Leader>h', '<Cmd>wincmd h<CR>', { noremap = true } },

    -- [ space + l ] move cursor to bottom window
    { 'n', '<Leader>j', '<Cmd>wincmd j<CR>', { noremap = true } },

    -- [ space + j ] move cursor to top window
    { 'n', '<Leader>k', '<Cmd>wincmd k<CR>', { noremap = true } },

    -- [ space + k ] move cursor to right window
    { 'n', '<Leader>l', '<Cmd>wincmd l<CR>', { noremap = true } },


	--[[
	#-------------------------------------------------------------------------#
	#                                CUT COPY PASTE                           #
	#-------------------------------------------------------------------------#
	--]]
    -- what in the hell ?????  (╯°□°）╯︵ ┻━┻
    -- delete without registering word
    { 'v', 'X', '"_d', { noremap = true } },

    -- delete&local-paste without registering
    { 'v', '<Leader>p', '"_dP', { noremap = true } },

    -- yank it to global register
    { 'n', '<Leader>y', '"+y', { noremap = true } },
    { 'v', '<Leader>y', '"+y', { noremap = true } },

    -- ????????
    { 'n', '<Leader>d', '"_d', { noremap = true } },
    { 'v', '<Leader>d', '"_d', { noremap = true } },

    -- yank all the content of file to global register ?? (╯°□°）╯︵ ┻━┻
    { 'n', '<Leader>Y', 'gg"+yG', { noremap = true } },


	--[[
	#-------------------------------------------------------------------------#
	#                                RESIZE WINDOW                            #
	#-------------------------------------------------------------------------#
	--]]

    -- resize window
    { 'n', '<Leader>+', '<Cmd>vertical resize +5<CR>', { noremap = true } },
    { 'n', '<Leader>-', '<Cmd>vertical resize -5<CR>', { noremap = true } },
    { 'n', '<Leader>rp', '<Cmd>resize 100<CR>', { noremap = true } },


	--[[
	#-------------------------------------------------------------------------#
	#                                MOVE LINE                                #
	#-------------------------------------------------------------------------#
	--]]

    -- move selected line to up/down
    { 'v', 'J', '<Cmd>m \'>+1<CR>gv=gv', { noremap = true } },
    { 'v', 'K', '<Cmd>m \'<-2<CR>gv=gv', { noremap = true } },
})


Keybind.g({
	--[[
	#-------------------------------------------------------------------------#
	#                                 TERMINAL                                #
	#-------------------------------------------------------------------------#
	--]]
    -- open terminal
    { 'n', '<Leader>\\t', '<Cmd>terminal<CR>', { noremap = true } },
    -- turn terminal to normal mode with escape
    { 't', '<Esc>', '<C-\\><C-n>', { noremap = true } },
    -- open neovim terminal
    { 'n', '<c-n>', '<Cmd>call OpenTerminal()<CR>', { noremap = true } },
})


Keybind.g({
	--[[
	#-------------------------------------------------------------------------#
	#                                   OTHER                                 #
	#-------------------------------------------------------------------------#
	--]]
    -- hit twice the spacebar if you want highlight to gone!
    { 'n', '<Leader>', '<Cmd>nohlsearch<Bar>:echo<CR>', { noremap = true, silent = true } },
    -- ctrl-c
    { 'i', '<C-c>', '<esc>', { noremap = true } },
    -- open help for selected word
    { 'n', '<Leader>ghw', '<Cmd>h <C-R>=expand("<cword>")<CR><CR>', { noremap = true } },
    -- Vim with me!! (customize theme with shortcut)
    { 'n', '<Leader>vwm', '<Cmd>call ColorMyPencils()<CR>', { noremap = true } },
})
