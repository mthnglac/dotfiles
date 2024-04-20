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

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1

# Aliases --------------------------------------------------------------------
alias bashconfig="nvim ~/.bashrc"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias tmuxconfig="nvim ~/.tmux.conf.local"
alias checkmyports="netstat -tulpn | grep LISTEN"
alias v="nvim"

# Cheat Sheet ----------------------------------------------------------------
cht() {
  curl cht.sh/$1/$2
}

# Java confs -----------------------------------------------------------------
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export PATH=$PATH:$JAVA_HOME

# Android confs --------------------------------------------------------------
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# GO confs --------------------------------------------------------------
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

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
