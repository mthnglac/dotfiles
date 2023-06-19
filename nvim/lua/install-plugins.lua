-- Bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =
      fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- Only required if you have packer configured as `opt`
vim.api.nvim_command([[packadd packer.nvim]])

local PackerHooks = vim.api.nvim_create_augroup("PackerHooks", {})
vim.api.nvim_create_autocmd("User", {
  pattern = "PackerCompileDone",
  callback = function()
    vim.notify("Packer Compile is Done!", vim.log.levels.INFO, { title = "Packer" })
  end,
  group = PackerHooks,
})

local packer = require("packer")
local packer_util = require("packer.util")

packer.init({
  opt_default = false,         -- Default to using opt (as opposed to start) plugins
  display = {
    open_fn = packer_util.float, -- An optional function to open a window for packer's display
    working_sym = "🛠",      -- The symbol for a plugin being installed/updated
    error_sym = "🧨",        -- The symbol for a plugin with an error in installation/updating
    done_sym = "🎉",         -- The symbol for a plugin which has completed installation/updating
    removed_sym = "🔥",      -- The symbol for an unused plugin which was removed
    moved_sym = "🚀",        -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = "━",        -- The symbol for the header line in packer's display
    show_all_info = true,      -- Should packer show all update details automatically?
    prompt_border = "double",  -- Border style of prompt popups.
  },
})

local use = packer.use
packer.reset()

packer.startup(function()
  -- tmux resurrect
  use({ "tpope/vim-obsession" })
  -- packer itself
  use({ "wbthomason/packer.nvim" })
  -- markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  -- api tool
  use({
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.rest-nvim")
    end,
  })
  -- formatter manager
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.null-ls-nvim")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  -- LSP & DAP & Linter & Formatter package manager
  use({
    "williamboman/mason.nvim",
    config = function()
      require("plugins.mason-nvim")
    end,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("plugins.mason-lspconfig-nvim")
    end,
  })
  -- built-in lsp manager
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp")
    end,
  })
  -- lsp status manager
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("plugins.fidget-nvim")
    end,
    tag = "legacy",
  })
  -- auto-completion
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.nvim-cmp")
    end,
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  })
  -- preview code
  use({
    "rmagatti/goto-preview",
    config = function()
      require("plugins.goto-preview-nvim")
    end,
  })
  -- speed up loading Lua modules
  use({ "lewis6991/impatient.nvim" })
  -- keep my last position!
  use({
    "ethanholz/nvim-lastplace",
    config = function()
      require("plugins.lastplace-nvim")
    end,
  })
  -- peek lines immediately with :<line_number>
  use({
    "nacro90/numb.nvim",
    config = function()
      require("plugins.numb-nvim")
    end,
  })
  -- mark manager plugin
  use({
    "ThePrimeagen/harpoon",
    config = function()
      require("plugins.harpoon-nvim")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  -- git worktree plugin
  use({
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("plugins.git-worktree-nvim")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })
  -- test plugin
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  })
  -- treesitter & extensions
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.nvim-treesitter")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })
  use({
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })
  use({
    "nvim-treesitter/playground",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })
  use({
    "windwp/nvim-ts-autotag",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })
  use({
    "theHamsta/nvim-treesitter-pairs",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })
  -- lua utils
  use({ "nvim-lua/plenary.nvim" })
  -- telescope & extensions
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    requires = {
      "nvim-telescope/telescope.nvim",
    },
  })
  use({
    "nvim-telescope/telescope-symbols.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
    },
  })
  use({
    "nvim-telescope/telescope-github.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })
  use({
    "LinArcX/telescope-env.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
    },
  })
  -- Git plugin for vim. Bestest of bests!!!
  use({
    "tpope/vim-fugitive",
    config = function()
      require("plugins.fugitive")
    end,
  })
  -- git pr preview
  use({
    "pwntester/octo.nvim",
    config = function()
      require("plugins.octo-nvim")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
  })
  -- Git diff preview
  use({
    "sindrets/diffview.nvim",
    config = function()
      require("plugins.diffview-nvim")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  -- debugger
  use({
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.nvim-dap")
    end,
  })
  use({
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
    },
  })
  -- check vim startup time
  use({ "dstein64/vim-startuptime" })
  -- displaying vertical lines
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent-blankline-nvim")
    end,
  })
  -- surroundings": parentheses, brackets, quotes vs.
  use({
    "kylechui/nvim-surround",
    config = function()
      require("plugins.surround-nvim")
    end,
  })
  -- file browser
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.nvim-tree")
    end,
    tag = "nightly",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  })
  -- for showing git sign: inserted, modified, deleted vs..
  -- also git blamer
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.git-signs-nvim")
    end,
  })
  -- commenter
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.comment-nvim")
    end,
  })
  -- Insert or delete brackets, parens, quotes in pair.
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.autopairs-nvim")
    end,
  })
  -- undotree
  use({
    "mbbill/undotree",
    config = function()
      require("plugins.undotree-vim")
    end,
  })
  -- Simple TODO plugin
  use({
    "vuciv/vim-bujo",
    config = function()
      require("plugins.bujo")
    end,
  })
  -- icons pack
  use({ "kyazdani42/nvim-web-devicons" })
  -- cursor navigation helper
  use({
    "phaazon/hop.nvim",
    config = function()
      require("plugins.hop-nvim")
    end,
  })
  -- buffer closer
  use({
    "Asheq/close-buffers.vim",
    config = function()
      require("plugins.close-buffers")
    end,
  })
  -- popup terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = function()
      require("plugins.toggleterm-nvim")
    end,
  })
  -- tab bar
  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    config = function()
      require("plugins.bufferline-nvim")
    end,
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  })
  -- distraction free mode
  use({
    "folke/zen-mode.nvim",
    config = function()
      require("plugins.zen-mode-nvim")
    end,
  })
  use({
    "folke/twilight.nvim",
    config = function()
      require("plugins.twilight-nvim")
    end,
  })
  -- status bar
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine-nvim")
    end,
  })
  -- theme
  use({
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("plugins.colors.gruvbox")
    end,
  })
  use({
    "navarasu/onedark.nvim",
    config = function()
      require("plugins.colors.onedark")
    end,
  })
  use({
    "folke/tokyonight.nvim",
    config = function()
      require("plugins.colors.tokyonight")
    end,
  })
  use({
    "Mofiqul/dracula.nvim",
    config = function()
      require("plugins.colors.dracula")
    end,
  })

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
