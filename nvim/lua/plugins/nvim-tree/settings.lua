require("nvim-tree").setup({
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	disable_netrw = true,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	open_on_tab = false,
	sort_by = "name",
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	on_attach = nil, -- on_attach fonksiyonunu özel keymap'ler için kullanabilirsiniz
	select_prompts = false,

	view = {
		adaptive_size = false,
		centralize_selection = false,
		width = 100,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 60,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},

	renderer = {
		add_trailing = true,
		group_empty = true,
		highlight_git = true,
		highlight_opened_files = "none",
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
		special_files = { "Cargo.toml", "README.md", "Makefile", "MAKEFILE" },
	},

	hijack_directories = {
		enable = true,
		auto_open = true,
	},

	update_focused_file = {
		enable = false,
		-- update_cwd = true,
		-- ignore_list = {
		-- 	"\\.pyc$",
		-- 	"^__pycache__$",
		-- 	".git$[[dir]]",
		-- 	".swp",
		-- 	"dist",
		-- 	"node_modules",
		-- 	"bower_components",
		-- 	".pnp",
		-- 	".cache",
		-- },
	},

	system_open = {
		cmd = nil,
		args = {},
	},

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
