#!/usr/bin/env zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# Python / Poetry
# export PATH="$HOME/.poetry/bin:$PATH"
# export PATH="$HOME/.local/bin:$PATH"


# Github Container Registry Token
export CR_PATH=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

export PATH=$PATH:$HOME/bin

# Android studio
export ANDROID_HOME=$HOME/Library/Android/sdk 
export ANDROID_HOME=$HOME/Library/Android/sdk 
export PATH=$PATH:$ANDROID_HOME/emulator 
export PATH=$PATH:$ANDROID_HOME/tools 
export PATH=$PATH:$ANDROID_HOME/tools/bin 
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Yarn
# export PATH="$PATH:$(yarn global bin)"

# LunarVim
export PATH="$PATH:/Users/geocoder/.local/bin"

# Rust
. "$HOME/.cargo/env"


NODE_BINARY=$(which node)
