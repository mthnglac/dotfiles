" firenvim confs -------------------------------------------------------------
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }
let fc = g:firenvim_config['localSettings']
let fc['https?://translate.google.com/.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://studio.youtube.com.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://instagram.com.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://twitter.com.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://.*gmail.com.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https://.*google.com.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://.*twitch.tv.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://.*jira.*'] = { 'takeover': 'never', 'priority': 1 }
"let fc['*localhost*'] = { 'takeover': 'never', 'priority': 1 }


" tab confs ------------------------------------------------------------------
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


" CoC.nvim confs -------------------------------------------------------------
" node path
let g:coc_node_path = '~/.nvm/versions/node/v12.18.4/bin/node'
" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" CoC-highlight confs --------------------------------------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')


" CoC-Snippets confs ---------------------------------------------------------
" for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" for jump with tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"" for choose with tab through autocomplete menu
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'


" airline_theme confs --------------------------------------------------------
let g:airline_theme='luna' " <theme> is a valid theme name
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" Dart confs -----------------------------------------------------------------
let dart_html_in_string = v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1


" NerdTREE confs -------------------------------------------------------------
" show hidden files
let NERDTreeShowHidden=1
" the ignore patterns are regular expression strings and seprated by comma
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
" to open automaticly when file opens
"augroup nerdtree_open
    "autocmd!
    "autocmd vimenter * nerdtree | wincmd p
"augroup end
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


" neoformat ------------------------------------------------------------------
let g:neoformat_enabled_python = ['black']
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


" gruvbox confs --------------------------------------------------------------
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
call ColorMyPencils()


" vim go (polyglot) settings. ------------------------------------------------
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

let g:vim_be_good_log_file = 1
let g:vim_apm_lig = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir = 'r -r'


" FzF confs ------------------------------------------------------------------
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}


" VIM shortcut confs ---------------------------------------------------------
" git actions
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
" open help for selected word
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
" search by selected word with CoC
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" search by selected word
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" buffer list window
nnoremap <leader>b :buffers<CR>:buffer<Space>
" search entered word within project
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>u :UndotreeShow<CR>
" file manager
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <leader>px :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" terminal
nnoremap <leader>\t :terminal<CR>
" search by filename in git files
nnoremap <C-p> :GFiles<CR>
" search by filename in all project files
nnoremap <leader>pf :Files<CR>
" source %
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
" resize window
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
" move selected line to up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" what in the hell ?????  (╯°□°）╯︵ ┻━┻
" delete without registering word
vnoremap X "_d
" delete&local-paste without registering
vnoremap <leader>p "_dP
" yank it to global register
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" yank all the content of file to global register
nnoremap <leader>Y gg"+yG
" navigation between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" hit twice the spacebar if you want highlight to gone!
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" vim TODO
nmap <leader>tu <Plug>BujoChecknormal
nmap <leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
let g:bujo#window_width = get(g:, "bujo#window_width", 100)
" Vim with me!! (customize theme with shortcut)
nnoremap <leader>vwm :call ColorMyPencils()<CR>
" ctrl-c
inoremap <C-c> <esc>
" Prettier confs
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>


" clear all registers --------------------------------------------------------
fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun


" removes any extraneous whitespace at the end of the lines ------------------
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


" YES ------------------------------------------------------------------------
com! W w


" highlight on yank!!! -------------------------------------------------------
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 400})
augroup END


" its PROPERTY!!! ------------------------------------------------------------
augroup MTHNGLAC
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()

    " Fire Neovim
    au BufEnter github.com_*.txt set filetype=markdown
    au BufEnter txti.es_*.txt set filetype=typescript
augroup END


" Goyo confs
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" quick-scope confs
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" close-buffers confs
nnoremap <silent> <C-q> :Bdelete menu<CR>


" floaterm confs
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
hi FloatermBorder guibg=black guifg=orange


" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction


" Terminal confs -------------------------------------------------------------
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
" open neovim terminal
nnoremap <c-n> :call OpenTerminal()<CR>
