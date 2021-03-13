lua require('utils')

"source ~/.config/nvim/common.vim
lua require('general.options')

"source ~/.config/nvim/install.vimplug.vim

"call plug#begin('~/.vim/plugged')
"source ~/.config/nvim/plugins.vim
lua require('install-plugins')
"call plug#end()

"source ~/.config/nvim/settings.plugins.vim
lua require('general.variables')
lua require('general.functions')
lua require('general.commands')
lua require('general.keybinds')
lua require('plugins')
lua require('general')
