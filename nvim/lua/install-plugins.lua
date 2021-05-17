local vim = vim
local function plug(path, config)
  vim.validate {
    path = {path, 's'},
    config = {config, vim.tbl_islist, 'an array of packages'},
  }
  vim.fn["plug#begin"](path)
  for _, v in ipairs(config) do
    if type(v) == 'string' then
      vim.fn["plug#"](v)
    elseif type(v) == 'table' then
      local p = v[1]
      assert(p, 'Must specify package as first index.')
      v[1] = nil
      vim.fn["plug#"](p, v)
      v[1] = p
    end
  end
  vim.fn["plug#end"]()
end

plug(tostring(os.getenv("HOME")) .. '/.vim/plugged', {
  -- Smooth scroll
  'psliwka/vim-smoothie',
  -- Treesitter
  {'nvim-treesitter/nvim-treesitter', ['do'] = ':TSUpdate'},
  'windwp/nvim-ts-autotag',
  -- Telescope
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope-fzy-native.nvim',
  'nvim-telescope/telescope-symbols.nvim',
  'kyazdani42/nvim-web-devicons',
  -- dispatcher
  'tpope/vim-dispatch',
  -- Git - blamer
  --'ttys3/nvim-blamer.lua',
  'f-person/git-blame.nvim',
  -- Git plugin for vim. Bestest of bests!!!
  'tpope/vim-fugitive',
  -- cheat.sh with popup plugin
  'RishabhRD/popfix',
  'RishabhRD/nvim-cheat.sh',
  -- debugger
  'puremourning/vimspector',
  -- Godot vim plugin
  'habamax/vim-godot',
  -- check vim startup time
  'tweekmonster/startuptime.vim',
  -- CoC
  {'neoclide/coc.nvim', ['branch'] = 'release'},
  -- A Vim plugin that runs 'gofmt' when you save
  'tweekmonster/gofmt.vim',
  -- displaying vertical lines
  'Yggdroot/indentLine',
  -- surroundings": parentheses, brackets, quotes vs.
  'tpope/vim-surround',
  -- manage virtualenv
  'jmcantrell/vim-virtualenv',
  -- file browser
  'preservim/nerdtree',
  'Xuyuanp/nerdtree-git-plugin',
  -- .gitignore plugin
  'gisphm/vim-gitignore',
  -- for showing git sign: inserted, modified, deleted vs..
  'airblade/vim-gitgutter',
  -- commenter
  'preservim/nerdcommenter',
  -- Insert or delete brackets, parens, quotes in pair.
  'jiangmiao/auto-pairs',
  -- for viewing man pages in vim.
  'vim-utils/vim-man',
  -- crab looking tool. looking for what you do shortly before
  'mbbill/undotree',
  -- A collection of language packs.
  'sheerun/vim-polyglot',
  -- Vlang
  'ollykel/v-vim',
  -- Simple TODO plugin
  'vuciv/vim-bujo',
  -- compiler plugin
  'tpope/vim-dispatch',
  -- icons pack
  'ryanoasis/vim-devicons',
  -- Prettier plugin
  {'prettier/vim-prettier', ['do'] = 'yarn install'},
  -- Presentation
  'junegunn/goyo.vim',
  'junegunn/limelight.vim',
  'vimwiki/vimwiki',
  -- firenvim
  {'glacambre/firenvim', ['do'] = function(_) vim.fn['firenvim#install'](69) end},
  -- An always-on highlight for a unique character in every word on a line to
  -- help you use f, F and family.
  'unblevable/quick-scope',
  -- repeat key for '.' key
  'tpope/vim-repeat',
  -- better whitespace
  'ntpeters/vim-better-whitespace',
  -- buffer closer
  'Asheq/close-buffers.vim',
  -- matchup with closing match
  'andymass/vim-matchup',
  -- popup terminal
  'numtostr/FTerm.nvim',
  -- colorschemes
  'colepeters/spacemacs-theme.vim',
  'gruvbox-community/gruvbox',
  'sainnhe/gruvbox-material',
  'phanviet/vim-monokai-pro',
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  'flazz/vim-colorschemes',
  'chriskempson/base16-vim',
  {'dracula/vim', ['as'] = 'dracula'},
  -- a vim game . thanks to ThePrimeagen!
  'ThePrimeagen/vim-be-good',
  -- vim command tracking tool.
  'ThePrimeagen/vim-apm',
})
