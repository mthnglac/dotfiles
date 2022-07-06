-- vim-plug settings & plugins
require('install-plugins')

-- speed up loading Lua modules
if pcall(require, 'impatient') then
    require('impatient').enable_profile()
end

-- generics
require('utils')

-- vim core settings
require('general')

-- vim plugins settings
require('plugins')
