source ~/.config/nvim/common.vim

"source ~/.config/nvim/install.vimplug.vim

call plug#begin('~/.vim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

source ~/.config/nvim/settings.plugins.vim
lua require('utils')
lua require('plugins')
lua require('general')
