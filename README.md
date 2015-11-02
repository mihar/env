## Install brew & packages

```ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

Install Cask for OS X apps

```brew install caskroom/cask/brew-cask```

Install packages

```bash
brew install bash-completion
brew install git
brew install wget
brew install vim
brew install imagemagick
brew install the_silver_searcher
brew install rbenv
brew install ruby-build
brew install nvm
brew install postgresql
brew install phantomjs
brew install heroku
brew install keybase
```

OS X apps

```bash
brew cask install iterm2
brew cask install dockertoolbox
```

## dotfiles
```bash
cd ~
ln -s ~/Dropbox/code/dotenv/home/bash_profile .bash_profile
ln -s ~/Dropbox/code/dotenv/home/bashrc .bashrc
ln -s ~/Dropbox/code/dotenv/home/gemrc .gemrc
ln -s ~/Dropbox/code/dotenv/home/gitconfig .gitconfig
ln -s ~/Dropbox/code/dotenv/home/vimrc .vimrc
ln -s ~/Dropbox/code/dotenv/home/npmrc .npmrc
```

## Sublime Text 3

```bash
cd ~/Library/Application\ Support/Sublime\ Text\ 3/
ln -s ~/Dropbox/Code/dotenv/sublime3/* .
```

## iTerm 2

iTerm has a nice convenient way of overriding which directory houses your settings.

![](http://i.imgur.com/pwGCOrj.png)
