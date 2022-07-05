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
  -- keep my last position!
  'ethanholz/nvim-lastplace',
  -- http request is fun!!
  'NTBBloodbath/rest.nvim',
  -- peek lines immediately with :<line_number>
  'nacro90/numb.nvim',
  -- mark manager plugin
  'ThePrimeagen/harpoon',
  -- git worktree plugin
  'ThePrimeagen/git-worktree.nvim',
  -- prettier
  {'prettier/vim-prettier', ['do'] = 'yarn install --frozen-lockfile --production' },
  -- test plugin
  'nvim-neotest/neotest',
  -- treesitter & extensions
  {'nvim-treesitter/nvim-treesitter', ['do'] = ':TSUpdate'},
  'windwp/nvim-ts-autotag',
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/playground',
  -- lua utils
  'nvim-lua/plenary.nvim',
  -- telescope & extensions
  'nvim-telescope/telescope.nvim',
  {'nvim-telescope/telescope-fzf-native.nvim', ['do'] = 'make'},
  'nvim-telescope/telescope-symbols.nvim',
  'nvim-telescope/telescope-github.nvim',
  'LinArcX/telescope-env.nvim',
  -- Git plugin for vim. Bestest of bests!!!
  'tpope/vim-fugitive',
  -- git pr preview
  'pwntester/octo.nvim',
  -- Git diff preview
  'sindrets/diffview.nvim',
  -- debugger
  'mfussenegger/nvim-dap',
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
  'tpope/vim-commentary',
  -- Insert or delete brackets, parens, quotes in pair.
  'jiangmiao/auto-pairs',
  -- crab looking tool. looking for what you do shortly before
  'mbbill/undotree',
  -- Simple TODO plugin
  'vuciv/vim-bujo',
  -- icons pack
  'kyazdani42/nvim-web-devicons',
  -- distraction-free
  'Pocco81/TrueZen.nvim',
  'junegunn/limelight.vim',
  -- firenvim
  {'glacambre/firenvim', ['do'] = function(_) vim.fn['firenvim#install'](69) end},
  -- cursor navigation helper
  'phaazon/hop.nvim',
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
  'morhetz/gruvbox',
  'sainnhe/gruvbox-material',
  'flazz/vim-colorschemes',
})
