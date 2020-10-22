# My confs ---------------------------------------------

#set -x # for testing delay of terminal opening

# android confs
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.rvm/scripts/rvm"
source ~/.rvm/scripts/rvm

# Yarn confs
# Yarn version manager
export YVM_DIR=/home/saruman/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
export PATH=$PATH:$HOME/.yarn/bin
#export PATH="$PATH:$(yarn global bin)"

# Dart confs
export PATH="$PATH:/usr/lib/dart/bin"

# the FUCK!
eval $(thefuck --alias)

# Parasut Corp. Confs
export EMBER_DOORKEEPER_APPLICATION_ID=1
export PHOENIX_DOORKEEPER_APPLICATION_ID=1

#set +x
