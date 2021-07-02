local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_config = {
      width = 0.9,
      height = 0.8,
      prompt_position = "top",
      preview_cutoff = 120,
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    layout_strategy = "horizontal",
    file_sorter =  require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require('telescope.sorters').get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    --buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    buffer_previewer_maker = new_maker,
  },
  extensions = {
    fzf = {
      -- false will only do exact matching
      fuzzy = true,
      -- override the generic sorter
      override_generic_sorter = false,
      -- override the file sorter
      override_file_sorter = true,
      -- or "ignore_case" or "respect_case". the default case_mode is "smart_case"
      case_mode = "smart_case",
    },
  },
})

require('telescope').load_extension('fzf')
--require('telescope').load_extension('fzy_native')
require('telescope').load_extension('gh')
require('telescope').load_extension('coc')
require('telescope').load_extension('node_modules')

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = tostring(os.getenv("HOME")) .. "/Code/development/dotfiles/",
    })
end

return M
