local vim = vim
local function plug(path, config)
  vim.validate({
    path = { path, 's' },
    config = { config, vim.tbl_islist, 'an array of packages' },
  })
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
  -- formatter manager
  'jose-elias-alvarez/null-ls.nvim',
  -- built-in lsp manager
  'neovim/nvim-lspconfig',
  -- lsp status manager
  'j-hui/fidget.nvim',
  -- auto-completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  -- preview code
  'rmagatti/goto-preview',
  -- LSP & DAP & Linter & Formatter package manager
  { 'williamboman/mason.nvim', ['branch'] = 'alpha' },
  -- speed up loading Lua modules
  'lewis6991/impatient.nvim',
  -- keep my last position!
  'ethanholz/nvim-lastplace',
  -- peek lines immediately with :<line_number>
  'nacro90/numb.nvim',
  -- mark manager plugin
  'ThePrimeagen/harpoon',
  -- git worktree plugin
  'ThePrimeagen/git-worktree.nvim',
  -- test plugin
  'nvim-neotest/neotest',
  -- treesitter & extensions
  { 'nvim-treesitter/nvim-treesitter', ['do'] = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/playground',
  'windwp/nvim-ts-autotag',
  'theHamsta/nvim-treesitter-pairs',
  -- lua utils
  'nvim-lua/plenary.nvim',
  -- telescope & extensions
  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', ['do'] = 'make' },
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
  'dstein64/vim-startuptime',
  -- displaying vertical lines
  'lukas-reineke/indent-blankline.nvim',
  -- surroundings": parentheses, brackets, quotes vs.
  'kylechui/nvim-surround',
  -- file browser
  'kyazdani42/nvim-tree.lua',
  -- for showing git sign: inserted, modified, deleted vs..
  -- also git blamer
  'lewis6991/gitsigns.nvim',
  -- commenter
  'numToStr/Comment.nvim',
  -- Insert or delete brackets, parens, quotes in pair.
  'windwp/nvim-autopairs',
  -- Simple TODO plugin
  'vuciv/vim-bujo',
  -- icons pack
  'kyazdani42/nvim-web-devicons',
  -- distraction-free
  'Pocco81/TrueZen.nvim',
  'junegunn/limelight.vim',
  -- cursor navigation helper
  'phaazon/hop.nvim',
  -- buffer closer
  'Asheq/close-buffers.vim',
  -- popup terminal
  'numtostr/FTerm.nvim',
  -- tab bar
  { 'akinsho/bufferline.nvim', ['tag'] = 'v2.*' },
  -- status bar
  'nvim-lualine/lualine.nvim',
  -- theme
  'ellisonleao/gruvbox.nvim',
})
