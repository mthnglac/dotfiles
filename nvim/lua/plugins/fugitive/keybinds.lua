Keybind.g({
  { "n", "<Space>gx", [[<Cmd>G<CR>]], { noremap = false, silent = true, desc = "Fugitive: Toggle git window" } },
  {
    "n",
    "<Space>gfa",
    [[<Cmd>Git fetch --all<CR>]],
    { noremap = true, silent = true, desc = "Fugitive: Fetch all" },
  },
  {
    "n",
    "<Space>grum",
    [[<Cmd>Git rebase upstream/master<CR>]],
    { noremap = true, silent = true, desc = "Fugitive: Rebase upstream/master" },
  },
  {
    "n",
    "<Space>grom",
    [[<Cmd>Git rebase origin/master<CR>]],
    { noremap = true, silent = true, desc = "Fugitive: Rebase origin/master" },
  },
})

-- when solving conflicts
Keybind.g({
  {
    "n",
    "<Space>gf",
    [[<Cmd>diffget //2<CR>]],
    { noremap = false, silent = true, desc = "Fugitive: Take from left" },
  },
  {
    "n",
    "<Space>gj",
    [[<Cmd>diffget //3<CR>]],
    { noremap = false, silent = true, desc = "Fugitive: Take from right" },
  },
})
