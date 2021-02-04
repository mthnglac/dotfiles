local packman = require('nvim.plugins.packman_lua.packman')


-- FILE EXPLORER
packman.get('kyazdani42/nvim-tree.lua')
packman.get('kyazdani42/nvim-web-devicons')



-- COLOR THEME
packman.get('mhartington/oceanic-next')
packman.get('eemed/sitruuna.vim')
packman.get('arzg/vim-colors-xcode')
packman.get('wadackel/vim-dogrun')

packman.get('tjdevries/colorbuddy.vim')
packman.get('tjdevries/gruvbuddy.nvim')
packman.get('npxbr/gruvbox.nvim')
packman.get('Th3Whit3Wolf/onebuddy')
packman.get('embark-theme/vim')



-- LANGUAGE SERVER CONFIGURATIONS
-- @TODO
-- 2020.11.24
-- there are some features missing with built-in lsp like go to definition
-- features should be further analyzed and should be configured
-- removing the plugin for now until I get time to configure for coc-nvim
-- packman.get('neovim/nvim-lspconfig')
packman.get('neoclide/coc.nvim')
packman.get('puremourning/vimspector')



-- AUTO COMPLETION FEATURES FOR LSP
-- @TODO
-- commenting out because completion is not useful unless built-in lsp is used
-- since coc-nvim comes with completion features
packman.get('nvim-lua/completion-nvim')



-- SEARCH
packman.get('junegunn/fzf')
packman.get('junegunn/fzf.vim')



-- GIT
packman.get('tpope/vim-fugitive')



-- EDITOR
-- auto pair brackets
packman.get('jiangmiao/auto-pairs')

-- box comments
packman.get('cometsong/CommentFrame.vim')

-- handle pair of text objects
packman.get('tpope/vim-surround')

-- syntax highlighting
packman.get('nvim-treesitter/nvim-treesitter')
packman.get('nvim-treesitter/playground')

-- stat
packman.get('romgrk/barbar.nvim')

-- terminal
packman.get('s1n7ax/nvim-terminal')
