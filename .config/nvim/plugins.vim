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
" .gitignore plugin
Plug 'gisphm/vim-gitignore'
" file browser
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
" distraction-free writing plugin
Plug 'junegunn/goyo.vim'
" firenvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(69) } }
"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO
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
