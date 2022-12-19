# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="sonicradish"

CASE_SENSITIVE="true"

plugins=(
  asdf
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  yarn
  web-search
  copypath
  copybuffer
  dirhistory
  jsontools
)

source $ZSH/oh-my-zsh.sh

# My confs $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

#set -x # for testing delay of terminal opening

# Aliases --------------------------------------------------------------------
# Access configs
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

# Deno confs -----------------------------------------------------------------
export DENO_INSTALL="${HOME}/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Java confs -----------------------------------------------------------------
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export PATH=$PATH:$JAVA_HOME

# Android confs --------------------------------------------------------------
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter confs --------------------------------------------------------------
export FLUTTER_HOME=$HOME/Flutter
export PATH=$PATH:$FLUTTER_HOME/bin

# Dart confs -----------------------------------------------------------------
export PATH="$PATH:/usr/lib/dart/bin"

# the FUCK! ------------------------------------------------------------------
eval $(thefuck --alias)

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

# added by travis gem --------------------------------------------------------
[ ! -s $HOME/.travis/travis.sh ] || source $HOME/.travis/travis.sh

#set +x

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
