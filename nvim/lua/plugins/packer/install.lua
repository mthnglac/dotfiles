-- This file can be loaded by calling `lua require('plugins')` from your init.vim


return require('packer').startup(function(use)
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Telescope
  use {'nvim-telescope/telescope.nvim', requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
  }}
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- ember-test-runner
  use 'toranb/vim-ember-cli-test-runner'

  -- dispatcher
  use 'tpope/vim-dispatch'

  -- selection increaser/decreaser
  use 'terryma/vim-expand-region'

  -- emberjs
  use 'joukevandermaas/vim-ember-hbs'

  -- show commit of current line
  use 'rhysd/git-messenger.vim'

  -- cheat.sh with popup plugin
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-cheat.sh'

  -- debugger
  use 'puremourning/vimspector'

  -- Godot vim plugin
  use 'habamax/vim-godot'

  -- check vim startup time
  use 'tweekmonster/startuptime.vim'

  -- CoC
  use {'neoclide/coc.nvim', branch = 'release', config = function ()
    require('plugins.coc-nvim')
  end}

  -- Snippets
  use 'mthnglac/vim-snippets'

  -- A Vim plugin that runs 'gofmt' when you save
  use 'tweekmonster/gofmt.vim'

  -- displaying vertical lines
  use 'Yggdroot/indentLine'

  -- surroundings": parentheses, brackets, quotes vs.
  use 'tpope/vim-surround'

  -- manage virtualenv
  use 'jmcantrell/vim-virtualenv'

  -- file browser
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'

  -- git blamer
  use 'APZelos/blamer.nvim'

  -- .gitignore plugin
  use 'gisphm/vim-gitignore'

  -- for showing git sign: inserted, modified, deleted vs..
  use 'airblade/vim-gitgutter'

  -- commenter
  use 'preservim/nerdcommenter'

  -- Insert or delete brackets, parens, quotes in pair.
  use 'jiangmiao/auto-pairs'

  -- Git plugin for vim. Bestest of bests!!!
  use 'tpope/vim-fugitive'

  -- for viewing man pages in vim.
  use 'vim-utils/vim-man'

  -- crab looking tool. looking for what you do shortly before
  use 'mbbill/undotree'

  -- A collection of language packs.
  use 'sheerun/vim-polyglot'

  -- Vlang
  use 'ollykel/v-vim'

  -- Simple TODO plugin
  use 'vuciv/vim-bujo'

  -- compiler plugin
  use 'tpope/vim-dispatch'

  -- icons pack
  use 'ryanoasis/vim-devicons'

  -- Prettier plugin
  use {'prettier/vim-prettier', run = 'yarn install' }

  -- Dart plugins
  use 'dart-lang/dart-vim-plugin'

  -- Presentation
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'vimwiki/vimwiki'

  -- firenvim
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](69) end }

  -- An always-on highlight for a unique character in every word on a line to help
  -- you use f, F and family.
  use 'unblevable/quick-scope'

  -- repeat key for '.' key
  use 'tpope/vim-repeat'

  -- better whitespace
  use 'ntpeters/vim-better-whitespace'

  -- buffer closer
  use 'Asheq/close-buffers.vim'

  -- matchup with closing match
  use 'andymass/vim-matchup'

  -- popup terminal
  use 'voldikss/vim-floaterm'

  -- colorschemes
  use 'colepeters/spacemacs-theme.vim'
  use 'gruvbox-community/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'phanviet/vim-monokai-pro'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'flazz/vim-colorschemes'
  use 'chriskempson/base16-vim'
  use {'dracula/vim', as = 'dracula' }

  -- a vim game . thanks to ThePrimeagen!
  use {'ThePrimeagen/vim-be-good', run = '.\\install.sh'}

  -- vim command tracking tool.
  use 'ThePrimeagen/vim-apm'
end)
