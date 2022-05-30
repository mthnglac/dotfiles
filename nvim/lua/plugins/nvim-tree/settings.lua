-- following options are the default
require('nvim-tree').setup({
  auto_reload_on_write = true,
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
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab = false,
  sort_by = "name",
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = false,
  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 45,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    hide_root_folder = false,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
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
    indent_markers = {
      enable = true,
      icons = {
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
        default = '',
        symlink = '',
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
          ignored = "◌"
        },
      },
    },
    --List of filenames that gets highlighted with NvimTreeSpecialFile
    special_files = {
      'README.md',
      'Makefile',
      'MAKEFILE'
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
    update_cwd  = true,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
		ignore_list = {
			'\\.pyc$',
			'^__pycache__$',
			'.git$[[dir]]',
			'.swp',
			'dist',
			--'tmp',
			'node_modules',
			'bower_components',
			'.pnp',
			'.cache',
		}
  },
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {'startify', 'dashboard'},
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
	filters = {
		dotfiles = true,
		custom = {},
    exclude = {},
	},
	git = {
		enable = true,
		ignore = true,
    timeout = 400,
	},
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      git = false,
      profile = false,
    },
  },
})
