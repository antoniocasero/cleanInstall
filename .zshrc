# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/casero/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

plugins=(terminalapp zsh-autosuggestions git brew omz_history)

source "$DOTFILES/aliases.zsh"
source "$DOTFILES/functions.zsh"
source "$DOTFILES/exports.zsh"
source "$DOTFILES/androidExports.zsh"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8