# Base development environment setup

This are the base config files and settings I use on my work and personal machines.

If you use Dropbox, it's also a nice way to keep all of your things in sync. *Sublime Text 3* and *iTerm* work very well with config file syncing over Dropbox. Just symlinks the files as instructed below and you should be good to go.

## Install packages

Install homebrew first

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
ln -s ~/Dropbox/Code/dotenv/home/bash_profile .bash_profile
ln -s ~/Dropbox/Code/dotenv/home/bashrc .bashrc
ln -s ~/Dropbox/Code/dotenv/home/gemrc .gemrc
ln -s ~/Dropbox/Code/dotenv/home/gitconfig .gitconfig
ln -s ~/Dropbox/Code/dotenv/home/vimrc .vimrc
ln -s ~/Dropbox/Code/dotenv/home/npmrc .npmrc
```

## Sublime Text 3

```bash
cd ~/Library/Application\ Support/Sublime\ Text\ 3/
ln -s ~/Dropbox/Code/dotenv/sublime3/* .
```

## Vim

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

## iTerm 2

iTerm has a nice convenient way of overriding which directory houses your settings.

![](http://i.imgur.com/pwGCOrj.png)
