Variable.g({
  --empty by default, don't auto open tree on specific filetypes.
  --nvim_tree_auto_ignore_ft = {'startify', 'dashboard'},
  --0 by default, this option shows indent markers when folders are open
  nvim_tree_indent_markers = 1,
  --0 by default, will enable file highlight for git attributes (can be used without the icons).
  nvim_tree_git_hl = 1,
  --0 by default, will enable folder and file icon highlight for opened files/directories.
  nvim_tree_highlight_opened_files = 0,
  --This is the default. See :help filename-modifiers for more options
  nvim_tree_root_folder_modifier = ':~',
  --0 by default, will not resize the tree when opening a file
  nvim_tree_width_allow_resize = 1,
  --0 by default, append a trailing slash to folder names
  nvim_tree_add_trailing = 1,
  -- 0 by default, compact folders that only contain a single folder into one node in the file tree
  nvim_tree_group_empty = 1,
  --List of filenames that gets highlighted with NvimTreeSpecialFile
  nvim_tree_special_files = {
    'README.md',
    'Makefile',
    'MAKEFILE'
  },
  --If 0, do not show the icons for one of 'git' 'folder' and 'files'
  --1 by default, notice that if 'files' is 1, it will only display
  --if nvim-web-devicons is installed and on your runtimepath.
  --if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
  --but this will not work when you set indent_markers (because of UI conflict)
  nvim_tree_show_icons = {
    ['git'] = 1,
    ['folders'] = 1,
    ['files'] = 1,
    ['folder_arrows'] = 0,
  },
  --default will show icon by default if no icon is provided
  --default shows no icon by default
  nvim_tree_icons = {
    ['default'] = '',
    ['symlink'] = '',
    ['git'] = {
      ['unstaged'] = "✗",
      ['staged'] = "✓",
      ['unmerged'] = "",
      ['renamed'] = "➜",
      ['untracked'] = "★",
      ['deleted'] = "",
      ['ignored'] = "◌"
      },
    ['folder'] = {
      ['arrow_open'] = "",
      ['arrow_closed'] = "",
      ['default'] = "",
      ['open'] = "",
      ['empty'] = "",
      ['empty_open'] = "",
      ['symlink'] = "",
      ['symlink_open'] = "",
      },
  }
})
