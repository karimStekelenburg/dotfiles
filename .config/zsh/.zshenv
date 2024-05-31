# ~/.zshenv
# 
# Order of file load --> .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#
# This file is loaded for all shell sessions (interactive, non-interactive, login, non-login).
# Best used for setting universal environment variables for automated processes. Howver
# it's best to define these in a separate script and source the scripts here, to keep things
# readable.

echo "Loading .zshenv"
source ~/.config/zsh/.secrets

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# Python / Poetry
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=/Users/karimstekelenburg/.local/bin:$PATH

# Pycharm
export PATH='/Applications/PyCharm.app/Contents/MacOS':$PATH

# Github Container Registry Token
export CR_PATH=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


# Android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=/opt/homebrew/bin:$PATH
# Yarn
# export PATH="$PATH:$(yarn global bin)"

# Rust
. "$HOME/.cargo/env"

# Go
export PATH=$PATH:/$(go env GOPATH)/bin

NODE_BINARY=$(which node)

# Ruby stuff
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Langchain
export LANGCHAIN_ENDPOINT=https://api.smith.langchain.com


DISPLAY=:0

export XDG_CONFIG_HOME="~/.config"
