local function check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- for jump with tab
function _G.coc_smart_tab()
  return vim.fn.pumvisible() == 1 and t'<C-n>' or check_back_space() and t'<Tab>' or vim.fn['coc#refresh']()
end

-- for choose with tab through autocomplete menu
function _G.coc_autocomplete_through()
  return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<C-h>'
end

-- Add (Neo)Vim's native statusline support.
function _G.statusline()
    local filepath = '%f'
    local align_section = '%='
    local percentage_through_file = '%p%%'

    return string.format(
        '%s%s%s',
        filepath,
        align_section,
        percentage_through_file
    )
end
