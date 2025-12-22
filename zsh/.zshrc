# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="sonicradish"

CASE_SENSITIVE="true"

plugins=(
  git
  yarn
  web-search
  copypath
  copybuffer
  dirhistory
  jsontools
)

source $ZSH/oh-my-zsh.sh

##############################################################################
# My confs ###################################################################
##############################################################################

### brew
# linux
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# mac 
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1

# Languages --------------------------------------------------------------------
# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# Rust
. "$HOME/.cargo/env"
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline)"
export LDFLAGS=""
export CPPFLAGS=""
# export PATH="$(gem environment gemdir)/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Aliases --------------------------------------------------------------------
alias bashconfig="nvim ~/.bashrc"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias tmuxconfig="nvim ~/.tmux.conf.local"
alias checkmyports="netstat -tulpn | grep LISTEN"
alias v="nvim"

# oh-my-zsh ------------------------------------------------------------------
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# vi mode
bindkey -v
export KEYTIMEOUT=1
# edit line in vim with <c-e>
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# default editor
export EDITOR='nvim'

PATH="/Users/metehan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/metehan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/metehan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/metehan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/metehan/perl5"; export PERL_MM_OPT;


# Load Angular CLI autocompletion.
# source <(ng completion script)

# nvm
export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
