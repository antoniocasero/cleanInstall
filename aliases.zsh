
# Global
alias snippets="code ~/Box\ Sync/Snippets/"
alias zshrc="code ~/.zshrc"
alias reload="source ~/.zshrc"

# Dev
alias dd='cd ~/Library/Developer/Xcode/DerivedData/'

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"
alias finder="open ."
alias rf="rm -rf "
alias lsl="ls -lhFA | less"

# Git
alias gpull="git pull --rebase --autostash origin"
alias greview="git review -d"
alias gpush="git push origin HEAD:refs/for/refs/heads/"
alias greset="git reset --hard "
alias commit="git add . && git commit -m"
alias gcommit="git add . && git commit"
alias amend="git commit --amend --no-edit"
alias amendall="git add . && amend"
alias wip="commit wip"
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias resolve="git add . && git commit --no-edit"
alias gl="git log --oneline --decorate --color"
alias gnuke="git clean -df && git reset --hard"
