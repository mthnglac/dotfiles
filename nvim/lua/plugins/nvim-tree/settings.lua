-- following options are the default
require("nvim-tree").setup({
	auto_reload_on_write = true,
  create_in_closed_folder = false,
	-- disables netrw completely
	disable_netrw = true,
	-- hijack the cursor in the tree to put it at the start of the filename
	hijack_cursor = false,
	-- hijack netrw window on startup
	-- prevents netrw from automatically opening when opening directories (but
	-- lets you keep its other utilities)
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	-- open the tree when running this setup function
	open_on_setup = false,
  open_on_setup_file = false,
	-- opens the tree when changing/opening a new tab if the tree wasn't previously opened
	open_on_tab = false,
	sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
	-- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = "disable",
  remove_keymaps = false,
  select_prompts = false,
	view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 60,
		hide_root_folder = false,
		-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			-- custom only false will merge the list with the default mappings
			-- if true, it will only use your list to set the mappings
			custom_only = false,
			-- list of mappings to set on the tree manually
			list = {},
		},
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
        width = 60,
        -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
        height = 30,
        row = 1,
        col = 1,
      },
    },
	},
	--false by default, this option shows indent markers when folders are open
	renderer = {
		--0 by default, append a trailing slash to folder names
		add_trailing = true,
		-- 0 by default, compact folders that only contain a single folder into one node in the file tree
		group_empty = true,
		--0 by default, will enable file highlight for git attributes (can be used without the icons).
		highlight_git = true,
		--0 by default, will enable folder and file icon highlight for opened files/directories.
		highlight_opened_files = "none",
		--This is the default. See :help filename-modifiers for more options
		root_folder_modifier = ":~",
    indent_width = 2,
		indent_markers = {
			enable = true,
			icons = {
        item = "├─",
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		--default will show icon by default if no icon is provided
		--default shows no icon by default
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		--List of filenames that gets highlighted with NvimTreeSpecialFile
		special_files = {
      "Cargo.toml",
			"README.md",
			"Makefile",
			"MAKEFILE",
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
	update_focused_file = {
		-- enables the feature
		enable = true,
		-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
		-- only relevant when `update_focused_file.enable` is true
		update_cwd = true,
		-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
		-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
		ignore_list = {
			"\\.pyc$",
			"^__pycache__$",
			".git$[[dir]]",
			".swp",
			"dist",
			--'tmp',
			"node_modules",
			"bower_components",
			".pnp",
			".cache",
		},
	},
	-- will not open on setup if the filetype is in this list
	ignore_ft_on_setup = { "startify", "dashboard" },
	-- configuration options for the system open command (`s` in the tree by default)
	system_open = {
		-- the command to run this, leaving nil should work in most cases
		cmd = nil,
		-- the command arguments as a list
		args = {},
	},
	-- show lsp diagnostics in the signcolumn
	diagnostics = {
		enable = false,
		show_on_dirs = false,
    debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = true,
		custom = {},
		exclude = {},
	},
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
	git = {
		enable = true,
		ignore = true,
    show_on_dirs = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
      restrict_above_cwd = false,
		},
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
    remove_file = {
      close_window = true,
    },
	},
	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
      dev = false,
      diagnostics = false,
			git = false,
			profile = false,
      watcher = false,
		},
	},
  notify = {
    threshold = vim.log.levels.INFO,
  },
})
