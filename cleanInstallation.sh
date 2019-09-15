#!/usr/bin/env bash

RUBY_VERSION=2.4.0
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Show the ~/Library folder
chflags nohidden ~/Library
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


    # Install Homebrew if it isn't already
if ! command -v brew &> /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update && brew upgrade brew-cask

echo "Oh my shell"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Brew packages"
for pkg in zsh zsh-completions fzf swiftlint ack carthage openssl git-lfs cmake repo ccache mono doxygen mackup z; do
  if brew list -1 | grep -q "^${pkg}\$"; then
      echo "Package '$pkg' is installed"
  else
      brew install $pkg
  fi
done

git lfs install

echo "Brew cask packages"
for pkg in alfred dropbox google-chrome vlc fastlane spotify go2shell docker ngrok visual-studio-code sourcetree box-sync bettertouchtool iterm2; do
  if brew cask list -1 | grep -q "^${pkg}\$"; then
      echo "Package '$pkg' is installed"
  else
      brew cask install $pkg
  fi
done

# Load RVM into a shell session *as a function*

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
else
  printf "ERROR: An RVM installation was not found.\n"
  echo "Ruby installation"
  curl -sSL https://get.rvm.io | bash -s stable --ruby
  rvm install $(RUBY_VERSION)
  rvm --default $(RUBY_VERSION)
  echo "Ruby installation"
  rvm use $(RUBY_VERSION)
fi



echo "Gem packages"
for pkg in cocoapods xcode-install xcpretty; do
  if gem list $pkg -1; then
      echo "Package '$pkg' is installed"
  else
      gem install $pkg
  fi
done



# Show compiling time in xcode
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES

# Restore default configurations
mackuop restore


