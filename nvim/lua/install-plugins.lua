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
	-- prettier
	{'prettier/vim-prettier', ['do'] = 'yarn install --frozen-lockfile --production' },
	-- partial code runner
	{'michaelb/sniprun', ['do'] = 'bash install.sh'},
	-- nvim notifier
	'rcarriga/nvim-notify',
	-- test plugin
	'vim-test/vim-test',
  -- Smooth scroll
  'psliwka/vim-smoothie',
  -- Treesitter
  {'nvim-treesitter/nvim-treesitter', ['do'] = ':TSUpdate'},
  'windwp/nvim-ts-autotag',
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/playground',
  'romgrk/nvim-treesitter-context',
  -- Telescope & extensions
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  {'nvim-telescope/telescope-fzf-native.nvim', ['do'] = 'make'},
  'nvim-telescope/telescope-symbols.nvim',
  'nvim-telescope/telescope-github.nvim',
  'fannheyward/telescope-coc.nvim',
  'nvim-telescope/telescope-frecency.nvim',
  -- sql using plugin
  'tami5/sql.nvim',
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  -- Git plugin for vim. Bestest of bests!!!
  'tpope/vim-fugitive',
  -- git pr preview
  'pwntester/octo.nvim',
  -- Git diff preview
	'sindrets/diffview.nvim',
  -- debugger
  'puremourning/vimspector',
  'mfussenegger/nvim-dap',
  -- Godot vim plugin
  'habamax/vim-godot',
  -- check vim startup time
  'tweekmonster/startuptime.vim',
  -- CoC
  {'neoclide/coc.nvim', ['branch'] = 'release'},
  -- displaying vertical lines
  'lukas-reineke/indent-blankline.nvim',
  -- surroundings": parentheses, brackets, quotes vs.
  'tpope/vim-surround',
  -- file browser
  'kyazdani42/nvim-tree.lua',
  -- .gitignore plugin
  'gisphm/vim-gitignore',
  -- for showing git sign: inserted, modified, deleted vs..
  -- also git blamer
  'lewis6991/gitsigns.nvim',
  -- commenter
  'preservim/nerdcommenter',
  -- Insert or delete brackets, parens, quotes in pair.
  'jiangmiao/auto-pairs',
  -- crab looking tool. looking for what you do shortly before
  'mbbill/undotree',
  -- Vlang
  'ollykel/v-vim',
  -- Simple TODO plugin
  'vuciv/vim-bujo',
  -- compiler plugin
  'tpope/vim-dispatch',
  -- icons pack
  'kyazdani42/nvim-web-devicons',
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
  -- status bar
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  -- colorschemes
  'colepeters/spacemacs-theme.vim',
  'morhetz/gruvbox',
  'sainnhe/gruvbox-material',
  'phanviet/vim-monokai-pro',
  'flazz/vim-colorschemes',
  'chriskempson/base16-vim',
  {'dracula/vim', ['as'] = 'dracula'},
	-- for training vim moves
	'tjdevries/train.nvim',
  -- a vim game . thanks to ThePrimeagen!
  'ThePrimeagen/vim-be-good',
})
