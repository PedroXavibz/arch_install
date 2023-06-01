# DEV
export _JAVA_AWT_WM_NONREPARENTING=1
export PYTHONPATH=/usr/lib/python3.10/site-packages/
export PYENV_ROOT=$HOME/.pyenv

# GENERAL
export LOCAL_BIN=$HOME/.local/bin/
export DWBARS=$HOME/scripts/dwmbars
export CARGO_BIN=$HOME/.cargo/bin/
export CARGO_ENV=$HOME/.cargo/env/
export GO_BIN=$HOME/.go/bin/
export DART_BIN=/opt/flutter/bin/
export SPICETIFY=$HOME/.spicetify

# NODEJS MANAGER
export NVM_DIR="$HOME/.config/nvm"

# ANDROID
export FLUTTER_BIN=$HOME/.flutter/bin
export ANDROID_SKD=$HOME/.android/cmdline-tools/latest/bin/
export ANDROID_PLATFORMS=$HOME/.android/platforms/
export ANDROID_PLATFORMS_TOOLS=$HOME/.android/platform-tools/
export ANDROID_EMULATOR=$HOME/.android/emulator/

export PATH="$LOCAL_BIN:$SPICETIFY:$FLUTTER_BIN:$ANDROID_SKD:$ANDROID_PLATFORMS:$ANDROID_PLATFORMS_TOOLS:$ANDROID_EMULATOR:$GO_BIN:$CARGO_BIN:$PYENV_ROOT/bin:$DWBARS:$PATH"

# CONFIG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export EDITOR=/usr/bin/nvim
export TERMINAL="st"
export BROWSER="firefox"
export POLYBAR=$HOME/.config/polybar/themes

# CODE EDITOR
export NVIM_DIR=$HOME/.config/nvim
export VIM_DIR=$HOME/.vim

# STUFFS
export OPENAI_API_KEY="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"

# SHELL
export ZSH=$HOME/.oh-my-zsh
export STARSHIP_CONFIG=$HOME/.config/starship.toml
export STARSHIP_CACHE=$HOME/.starship/cache

# FZF
export FZF_DEFAULT_COMMAND="fd --type f --hidden"
export FZF_DEFAULT_OPTS="--height 100% --cycle --layout=reverse --border"
# export FZF_DEFAULT_OPTS="--height 70% --cycle --layout=reverse --border --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx -- -keeptty >~/.xorg.log 2>&1
fi

# MONITOR
#if [ $(xrandr --output HDMI-A-0 --mode 1024x768 --pos 1366x0 --rotate normal --output eDP --primary --mode 1366x768 --pos 0x0 --rotate normal && nitrogen --restore) ]; then
#	exit 0
#fi
