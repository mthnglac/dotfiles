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

augroup MTHNGLAC
    autocmd!
    au BufEnter github.com_*.txt set filetype=markdown
    au BufEnter txti.es_*.txt set filetype=typescript
    au BufEnter stackoverflow_*.txt set filetype=markdown
augroup END
