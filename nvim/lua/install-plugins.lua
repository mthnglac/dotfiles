-- Bootstrapping Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- AI
	-- {
	--   "olimorris/codecompanion.nvim",
	--   config = function()
	--     require("plugins.codecompanion-nvim")
	--   end,
	--   dependencies = {
	--     "ravitemer/codecompanion-history.nvim",
	--     "nvim-lua/plenary.nvim",
	--     "nvim-treesitter/nvim-treesitter",
	--   },
	-- },
	{
		"github/copilot.vim",
	},
	-- {
	--   "azorng/goose.nvim",
	--   config = function()
	--     require("plugins.goose-nvim")
	--   end,
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--     {
	--       "MeanderingProgrammer/render-markdown.nvim",
	--       opts = {
	--         anti_conceal = { enabled = false },
	--         latex = { enabled = false },
	--       },
	--     }
	--   },
	-- },
	-- Diagnostics
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		lazy = false,
		config = function()
			require("plugins.trouble-nvim")
		end,
	},
	-- developer assister
	{
		"folke/neodev.nvim",
		config = function()
			require("plugins.neodev-nvim")
		end,
	},
	-- tmux resurrect
	{ "tpope/vim-obsession" },
	-- formatter manager
	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("plugins.none-ls-nvim")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- LSP & DAP & Linter & Formatter package manager
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.mason-nvim")
		end,
	},
	-- built-in lsp manager
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig-nvim")
		end,
	},
	-- lsp status manager
	{
		"j-hui/fidget.nvim",
		config = function()
			require("plugins.fidget-nvim")
		end,
	},
	-- auto-completion
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.nvim-cmp")
		end,
		dependencies = {
      'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	-- preview code
	{
		"rmagatti/goto-preview",
		config = function()
			require("plugins.goto-preview-nvim")
		end,
		dependencies = {
			"rmagatti/logger.nvim",
		},
		event = "BufEnter",
	},
	-- keep my last position!
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("plugins.lastplace-nvim")
		end,
	},
	-- peek lines immediately with :<line_number>
	{
		"nacro90/numb.nvim",
		config = function()
			require("plugins.numb-nvim")
		end,
	},
	-- mark manager plugin
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("plugins.harpoon-nvim")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- git worktree plugin
	{
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			require("plugins.git-worktree-nvim")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	-- test plugin
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
		},
		config = function()
			require("plugins.neotest-nvim")
		end,
	},
	-- treesitter & extensions
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.nvim-treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-treesitter/nvim-treesitter-refactor",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-treesitter/playground",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"theHamsta/nvim-treesitter-pairs",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	-- lua utils
	{ "nvim-lua/plenary.nvim", branch = "master" },
	-- telescope & extensions
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.telescope")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"nvim-telescope/telescope-github.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"LinArcX/telescope-env.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	-- Git plugin for vim. Bestest of bests!!!
	{
		"tpope/vim-fugitive",
		config = function()
			require("plugins.fugitive")
		end,
	},
	-- git pr preview
	{
		"pwntester/octo.nvim",
		config = function()
			require("plugins.octo-nvim")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
	},
	-- Git diff preview
	{
		"sindrets/diffview.nvim",
		config = function()
			require("plugins.diffview-nvim")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- debugger
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins.nvim-dap")
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest",
		},
	},
	-- displaying vertical lines
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent-blankline-nvim")
		end,
	},
	-- surroundings: parentheses, brackets, quotes, etc.
	{
		"kylechui/nvim-surround",
		config = function()
			require("plugins.surround-nvim")
		end,
	},
	-- file browser
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.nvim-tree")
		end,
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	-- for showing git sign: inserted, modified, deleted, etc. Also git blamer
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.git-signs-nvim")
		end,
	},
	-- Insert or delete brackets, parens, quotes in pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs-nvim")
		end,
	},
	-- undotree
	{
		"mbbill/undotree",
		config = function()
			require("plugins.undotree-vim")
		end,
	},
	-- Simple TODO plugin
	{
		"vuciv/vim-bujo",
		config = function()
			require("plugins.bujo")
		end,
	},
	-- icons pack
	{ "kyazdani42/nvim-web-devicons" },
	-- cursor navigation helper
	{
		"phaazon/hop.nvim",
		config = function()
			require("plugins.hop-nvim")
		end,
	},
	-- buffer closer
	{
		"Asheq/close-buffers.vim",
		config = function()
			require("plugins.close-buffers")
		end,
	},
	-- popup terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("plugins.toggleterm-nvim")
		end,
	},
	-- tab bar
	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = function()
			require("plugins.bufferline-nvim")
		end,
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	-- distraction free mode
	{
		"folke/zen-mode.nvim",
		config = function()
			require("plugins.zen-mode-nvim")
		end,
	},
	{
		"folke/twilight.nvim",
		config = function()
			require("plugins.twilight-nvim")
		end,
	},
	-- status bar
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine-nvim")
		end,
	},
	-- window manager
	{
		"szw/vim-maximizer",
		config = function()
			require("plugins.maximizer")
		end,
	},
	-- UI
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins.neoscroll-nvim")
		end,
	},
	-- -- themes
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("plugins.colors.gruvbox")
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("plugins.colors.onedark")
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("plugins.colors.tokyonight")
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("plugins.colors.dracula")
		end,
	},
})
