local vim = vim
local function plug(path, config)
  vim.validate {
    path = {path, 's'};
    config = {config, vim.tbl_islist, 'an array of packages'};
  }
  vim.fn["plug#begin"](path)
  for _, v in ipairs(config) do
    if type(v) == 'string' then
      vim.fn["plug#"](v)
    elseif type(v) == 'table' then
      local p = v[1]
      assert(p, 'Must specify package as first index.')
      v[1] = nil
      vim.fn["plug#"](p, v)
      v[1] = p
    end
  end
  vim.fn["plug#end"]()
end

plug(tostring(os.getenv("HOME")) .. '/.vim/plugged', {
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  'nvim-telescope/telescope-fzy-native.nvim';
  'nvim-telescope/telescope-symbols.nvim';
  'toranb/vim-ember-cli-test-runner';
  'tpope/vim-dispatch';
  'terryma/vim-expand-region';
  'joukevandermaas/vim-ember-hbs';
  'rhysd/git-messenger.vim';
  'RishabhRD/popfix';
  'RishabhRD/nvim-cheat.sh';
  'puremourning/vimspector';
  'habamax/vim-godot';
  'tweekmonster/startuptime.vim';
  {'neoclide/coc.nvim'; branch = 'release'};
  'mthnglac/vim-snippets';
  'tweekmonster/gofmt.vim';
  'Yggdroot/indentLine';
  'tpope/vim-surround';
  'jmcantrell/vim-virtualenv';
  'preservim/nerdtree';
  'Xuyuanp/nerdtree-git-plugin';
  'APZelos/blamer.nvim';
  'gisphm/vim-gitignore';
  'airblade/vim-gitgutter';
  'preservim/nerdcommenter';
  'jiangmiao/auto-pairs';
  'tpope/vim-fugitive';
  'vim-utils/vim-man';
  'mbbill/undotree';
  'sheerun/vim-polyglot';
  'ollykel/v-vim';
  'vuciv/vim-bujo';
  'tpope/vim-dispatch';
  'ryanoasis/vim-devicons';
  {'prettier/vim-prettier'; run = 'yarn install'};
  'dart-lang/dart-vim-plugin';
  'junegunn/goyo.vim';
  'junegunn/limelight.vim';
  'vimwiki/vimwiki';
  {'glacambre/firenvim'; run = function() vim.fn['firenvim#install'](69) end};
  'unblevable/quick-scope';
  'tpope/vim-repeat';
  'ntpeters/vim-better-whitespace';
  'Asheq/close-buffers.vim';
  'andymass/vim-matchup';
  'voldikss/vim-floaterm';
  'colepeters/spacemacs-theme.vim';
  'gruvbox-community/gruvbox';
  'sainnhe/gruvbox-material';
  'phanviet/vim-monokai-pro';
  'vim-airline/vim-airline';
  'vim-airline/vim-airline-themes';
  'flazz/vim-colorschemes';
  'chriskempson/base16-vim';
  {'dracula/vim'; as = 'dracula'};
  {'ThePrimeagen/vim-be-good'; run = '.\\install.sh'};
  'ThePrimeagen/vim-apm';
})
