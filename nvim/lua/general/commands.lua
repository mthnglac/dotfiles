Command.cmd({
  -- hello front end masters
  "set path+=**",

  -- Nice menu when typing `:find *.py`
  "set wildmode=longest,list,full",
  "set wildmenu",
  -- Ignore files
  "set wildignore+=*.pyc",
  "set wildignore+=*_build/*",
  "set wildignore+=**/coverage/*",
  "set wildignore+=**/node_modules/*",
  "set wildignore+=**/android/*",
  "set wildignore+=**/ios/*",
  "set wildignore+=**/.git/*",
})
