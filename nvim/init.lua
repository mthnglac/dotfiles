-- generics
require('utils')

-- vim core settings
Reload.reload_module('general')
require('general')

-- vim-plug settings & plugins
Reload.reload_module('install-plugins')
require('install-plugins')

-- vim plugins settings
Reload.reload_module('plugins')
require('plugins')
