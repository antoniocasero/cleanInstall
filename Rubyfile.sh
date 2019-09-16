#!/bin/sh

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

source .

echo "Gem packages:"

gem install cocoapods
gem install xcpretty
