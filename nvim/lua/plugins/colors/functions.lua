-- theme confs
vim.api.nvim_exec(
[[
fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'
    colorscheme gruvbox
    set background=dark

    "highlight ColorColumn ctermbg=0 guibg=#4f4f4f
    "highlight Normal guibg=none
    "highlight LineNr guifg=#ff8659
    "highlight LineNr guifg=#aed75f
    "highlight LineNr guifg=#5eacd3
    "highlight netrwDir guifg=#5eacd3
    "highlight qfFileName guifg=#aed75f
endfun
]], true)

-- random theme pick
vim.api.nvim_exec(
[[
fun! SurpriseMe()
    colorscheme random
endfun
]], true)
