-- Lua
local actions = require("diffview.actions")

require("diffview").setup({
	diff_binaries = false, -- Show diffs for binaries
	enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  git_cmd = { "git" },
	use_icons = true, -- Requires nvim-web-devicons
	icons = { -- Only applies when use_icons is true.
		folder_closed = "",
		folder_open = "",
	},
	signs = {
		fold_closed = "",
		fold_open = "",
	},
	file_panel = {
		listing_style = "tree", -- One of 'list' or 'tree'
		tree_options = { -- Only applies when listing_style is 'tree'
			flatten_dirs = true,
			folder_statuses = "always", -- One of 'never', 'only_folded' or 'always'.
		},
		win_config = {
			position = "left", -- One of 'left', 'right', 'top', 'bottom'
			width = 35, -- Only applies when position is 'left' or 'right'
			height = 10, -- Only applies when position is 'top' or 'bottom'
		},
	},
	file_history_panel = {
		log_options = {
      git = {
        single_file = {
          max_count = 256, -- Limit the number of commits
          follow = false, -- Follow renames (only for single file)
          all = false, -- Include all refs under 'refs/' including HEAD
          merges = false, -- List only merge commits
          no_merges = false, -- List no merge commits
          reverse = false, -- List commits in reverse order
        },
        multi_file = {
          max_count = 256, -- Limit the number of commits
          all = false, -- Include all refs under 'refs/' including HEAD
          merges = false, -- List only merge commits
          no_merges = false, -- List no merge commits
          reverse = false, -- List commits in reverse order
        },
      },
		},
		win_config = {
			position = "bottom",
			width = 35,
			height = 16,
		},
	},
  commit_log_panel = {
    win_config = {},
  },
	default_args = { -- Default args prepended to the arg-list for the listed commands
		DiffviewOpen = {},
		DiffviewFileHistory = {},
	},
  hooks = {},
	keymaps = {
		disable_defaults = false, -- Disable the default key bindings
		-- The `view` bindings are active in the diff buffers, only when the current
		-- tabpage is a Diffview.
		view = {
      ["<tab>"] = actions.select_next_entry, -- Open the diff for the next file
      ["<s-tab>"] = actions.select_prev_entry, -- Open the diff for the previous file
      ["gf"] = actions.goto_file, -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = actions.goto_file_split, -- Open the file in a new split
      ["<C-w>gf"] = actions.goto_file_tab, -- Open the file in a new tabpage
      ["<leader>e"] = actions.focus_files, -- Bring focus to the files panel
      ["<leader>b"] = actions.toggle_files, -- Toggle the files panel.
		},
		file_panel = {
      ["j"] = actions.next_entry, -- Bring the cursor to the next file entry
      ["<down>"] = actions.next_entry,
      ["k"] = actions.prev_entry, -- Bring the cursor to the previous file entry.
      ["<up>"] = actions.prev_entry,
      ["<cr>"] = actions.select_entry, -- Open the diff for the selected entry.
      ["o"] = actions.select_entry,
      ["<2-LeftMouse>"] = actions.select_entry,
      ["-"] = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
      ["S"] = actions.stage_all, -- Stage all entries.
      ["U"] = actions.unstage_all, -- Unstage all entries.
      ["X"] = actions.restore_entry, -- Restore entry to the state on the left side.
      ["R"] = actions.refresh_files, -- Update stats and entries in the file list.
      ["<tab>"] = actions.select_next_entry,
      ["<s-tab>"] = actions.select_prev_entry,
      ["gf"] = actions.goto_file,
      ["<C-w><C-f>"] = actions.goto_file_split,
      ["<C-w>gf"] = actions.goto_file_tab,
      ["i"] = actions.listing_style, -- Toggle between 'list' and 'tree' views
      ["f"] = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"] = actions.focus_files,
      ["<leader>b"] = actions.toggle_files,
		},
		file_history_panel = {
      ["g!"] = actions.options, -- Open the option panel
      ["<C-A-d>"] = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
      ["y"] = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
      ["zR"] = actions.open_all_folds,
      ["zM"] = actions.close_all_folds,
      ["j"] = actions.next_entry,
      ["<down>"] = actions.next_entry,
      ["k"] = actions.prev_entry,
      ["<up>"] = actions.prev_entry,
      ["<cr>"] = actions.select_entry,
      ["o"] = actions.select_entry,
      ["<2-LeftMouse>"] = actions.select_entry,
      ["<tab>"] = actions.select_next_entry,
      ["<s-tab>"] = actions.select_prev_entry,
      ["gf"] = actions.goto_file,
      ["<C-w><C-f>"] = actions.goto_file_split,
      ["<C-w>gf"] = actions.goto_file_tab,
      ["<leader>e"] = actions.focus_files,
      ["<leader>b"] = actions.toggle_files,
		},
		option_panel = {
      ["<tab>"] = actions.select_entry,
      ["q"] = actions.close,
		},
	},
})
