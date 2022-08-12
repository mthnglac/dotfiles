Keybind.g({
  -- search entered word within project
  {
    "n",
    "<Leader>ps",
    [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]],
    { noremap = true, silent = true },
  },
  -- search under buffers path
  {
    "n",
    "<Leader>pcb",
    [[<Cmd>lua require('telescope.builtin').find_files({cwd=require("telescope.utils").buffer_dir()})<CR>]],
    { noremap = true, silent = true },
  },
  -- search by selected word
  {
    "n",
    "<Leader>pw",
    [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]],
    { noremap = true, silent = true },
  },
  -- live grep
  {
    "n",
    "<Leader>pl",
    [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]],
    { noremap = true, silent = true },
  },
  -- buffer list window
  { "n", "<Leader>pb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true } },
  -- search by filename in all project files
  {
    "n",
    "<Leader>pf",
    [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
    { noremap = true, silent = true },
  },
})

-- Custom paths
Keybind.g({
  -- telescope through dotfiles
  {
    "n",
    "<Leader>prc",
    [[<Cmd>lua require('plugins.telescope.settings').search_dotfiles()<CR>]],
    { noremap = true, silent = true },
  },
  -- telescope through development/notes
  {
    "n",
    "<Leader>prn",
    [[<Cmd>lua require('plugins.telescope.settings').search_notes()<CR>]],
    { noremap = true, silent = true },
  },
})

-- Git
Keybind.g({
  -- search by filename in git files
  { "n", "<C-p>", [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true } },
  -- git status
  {
    "n",
    "<Leader>gstt",
    [[<Cmd>lua require('telescope.builtin').git_status()<CR>]],
    { noremap = true, silent = true },
  },
  -- git branches
  {
    "n",
    "<Leader>gb",
    [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]],
    { noremap = true, silent = true },
  },
  -- git stashes
  {
    "n",
    "<Leader>gsth",
    [[<Cmd>lua require('telescope.builtin').git_stash()<CR>]],
    { noremap = true, silent = true },
  },
  -- git commits
  {
    "n",
    "<Leader>gc",
    [[<Cmd>lua require('telescope.builtin').git_commits()<CR>]],
    { noremap = true, silent = true },
  },
  -- git buffer commits
  {
    "n",
    "<Leader>glc",
    [[<Cmd>lua require('telescope.builtin').git_bcommits()<CR>]],
    { noremap = true, silent = true },
  },
})
