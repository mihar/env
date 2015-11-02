# Base development environment setup

This are the base config files and settings I use on my work and personal machines.

If you use Dropbox, it's also a nice way to keep all of your things in sync. *Sublime Text 3* and *iTerm* work very well with config file syncing over Dropbox. Just symlinks the files as instructed below and you should be good to go.

## Install packages

**Install homebrew first**

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**Install Cask for OS X apps**

```
brew install caskroom/cask/brew-cask
```

**Install packages**

```bash
brew install bash-completion
brew install git
brew install wget
brew install vim
brew install imagemagick
brew install the_silver_searcher
brew install rbenv
brew install rbenv-gemset
brew install ruby-build
brew install nvm
brew install postgresql
brew install phantomjs
brew install heroku
brew install keybase
```

**Install OS X apps**

```bash
brew cask install sublime-text3
brew cask install iterm2-nightly
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
ln -s ~/Dropbox/Code/dotenv/home/inputrc .inputrc
ln -s ~/Dropbox/Code/dotenv/home/npmrc .npmrc
```

## Sublime Text 3

```bash
cd ~/Library/Application\ Support/Sublime\ Text\ 3/
ln -s ~/Dropbox/Code/dotenv/sublime3/* .
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/
```

**Plugins that you get:**

* SublimeLinter (Ruby, RuboCop, ESLint, CoffeeLint, Haml)
* Advanced New File
* Alignment
* All Autocomplete
* Bracket Highlighter
* EditorConfig
* Git
* LoremIpsum
* PackageControl
* Pretty JSON
* SidebarEnhancement
* Vintageous

**Syntaxes that you get:**

* CoffeeScript
* Dockerfile
* JSNext - ES6
* RSpec
* Sass
* Haml

**Themes that you get:**

* Spacegray
  The best dark theme out there

* Tomorrow
  The best light theme out there

## Vim

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

**Plugins that you get:**

* Vundle (vim bundler)
* base16 color scheme
* ctrlp
* ack
* fugitive
* ruby
* pathogen

## iTerm 2

iTerm has a nice convenient way of overriding which directory houses your settings.

![](http://i.imgur.com/pwGCOrj.png)

## Font

For my terminal usage I use **Meslo**, which is a customized version of Apple's Menlo typeface. Main differentiator is that it offers three different line-heights baked into the type, because back in the day, most terminal applications were oblivious to the importance of such a setting.

iTerm 2 has such a setting now, but I still prefer to use the **Meslo LG L DZ** at 12pts.

For more information look at this [blog post](http://mir.aculo.us/2010/10/12/the-long-search-for-a-terminal-font-is-over/).

The font files can be downloaded from GitHub [here](https://github.com/andreberg/Meslo-Font/downloads).
