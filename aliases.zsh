
# Global
alias snippets="code ~/Box\ Sync/Snippets/"
alias zshrc="code ~/.zshrc"
alias reload="source ~/.zshrc"
alias size="du -h * | sort -h"

# Dev
alias dd='cd ~/Library/Developer/Xcode/DerivedData/'
alias clang-format-all="find . -name \"*.cpp\" -o -name \"*.hpp\"  | sed 's| |\\ |g' | xargs clang-format -i"
alias clang-format-all-java="find . -name \"*.java\"  | sed 's| |\\ |g' | xargs clang-format -i -style=file"
alias configure="HERESDK_MODULE_CONFIG=\"dev\" ./sdk/cmake/scripts/configure-ios-simulator.cmake"
alias iot-format="./sdk/cmake/scripts/apply_format.cmake"
alias iot-android-cucumber-tests='./gradlew -PoverrideAbiFilters="x86_64" -PoverrideInstallOptions="" :cucumber:connectedDebugAndroidTest'
alias iot-android-unit-tests='./gradlew -PoverrideAbiFilters="x86_64" -PoverrideInstallOptions="" :modules:connectedDebugAndroidTest'

# Directories
alias dotfiles="code $DOTFILES"
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
# checks for any files flagged w/ --skip-worktree alias
alias check="git ls-files -v|grep '^S'"
# Mostly on configuration files where you need some specific changes
# locally, ignored by git.
# add --skip-worktree flag to file
skip() {  git update-index --skip-worktree "$@";  git status; }
# remove --skip-worktree flag from file
unskip() {  git update-index --no-skip-worktree "$@";  git status; }
# delete all dirty files from the selected repository
gitclean() { pushd "$@"; git clean -xdf; popd; }

#web
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'
crat() { npx create-react-app $1 --typescript }
