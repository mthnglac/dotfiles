" emberjs
Plug 'joukevandermaas/vim-ember-hbs'
" show commit of current line
Plug 'rhysd/git-messenger.vim'
" cheat.sh with popup plugin
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
" Debugger
Plug 'puremourning/vimspector'
" Godot vim plugin
Plug 'habamax/vim-godot'
" check vim startup time
Plug 'tweekmonster/startuptime.vim'
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippets
Plug 'mthnglac/vim-snippets'
" A Vim plugin that runs 'gofmt' when you save
Plug 'tweekmonster/gofmt.vim'
" displaying vertical lines
Plug 'Yggdroot/indentLine'
" surroundings": parentheses, brackets, quotes vs.
Plug 'tpope/vim-surround'
" manage virtualenv
Plug 'jmcantrell/vim-virtualenv'
" file browser
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" git blamer
Plug 'APZelos/blamer.nvim'
" .gitignore plugin
Plug 'gisphm/vim-gitignore'
" for showing git sign: inserted, modified, deleted vs..
Plug 'airblade/vim-gitgutter'
" commenter
Plug 'preservim/nerdcommenter'
" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
" Git plugin for vim. Bestest of bests!!!
Plug 'tpope/vim-fugitive'
" for viewing man pages in vim.
Plug 'vim-utils/vim-man'
" crab looking tool. looking for what you do shortly before
Plug 'mbbill/undotree'
" A collection of language packs.
Plug 'sheerun/vim-polyglot'
" Vlang
Plug 'ollykel/v-vim'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
" Simple TODO plugin
Plug 'vuciv/vim-bujo'
" compiler plugin
Plug 'tpope/vim-dispatch'
" icons pack
Plug 'ryanoasis/vim-devicons'
" Prettier plugin
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Dart plugins
Plug 'dart-lang/dart-vim-plugin'
" Presentation
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'
" firenvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(69) } }
" An always-on highlight for a unique character in every word on a line to help
" you use f, F and family.
Plug 'unblevable/quick-scope'
" repeat key for '.' key
Plug 'tpope/vim-repeat'
" better whitespace
Plug 'ntpeters/vim-better-whitespace'
" buffer closer
Plug 'Asheq/close-buffers.vim'
" matchup with closing match
Plug 'andymass/vim-matchup'
" popup terminal
Plug 'voldikss/vim-floaterm'
" colorschemes
Plug 'colepeters/spacemacs-theme.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" a vim game . thanks to ThePrimeagen!
Plug 'ThePrimeagen/vim-be-good', {'do': '.\install.sh'}
" vim command tracking tool.
Plug 'ThePrimeagen/vim-apm'
