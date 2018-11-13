# Base development environment setup

This are the base config files and settings I use on my work and personal machines.

If you use Dropbox, it's also a nice way to keep all of your things in sync. *iTerm 2* works well with config file syncing over Dropbox. Just symlink the files as instructed below and you should be good to go.

## Install packages

**Install homebrew first**

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**Install packages**

```bash
brew install fish
brew install git
brew install wget
brew install vim
brew install imagemagick
brew install the_silver_searcher
brew install rbenv
brew install rbenv-gemset
brew install ruby-build
brew install nodenv
brew install node-build
brew install postgresql
brew install heroku
brew install ffmpeg
brew install nmap
```

**Install the Fish shell**

```bash
curl -L https://get.oh-my.fish | fish
sudo echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish
omf install rbenv
omf install nodenv
omf install bobthefish
```

**Install OS X apps**

```bash
brew cask install atom
brew cask install iterm2
brew cask install docker
brew cask install phantomjs
```

## dotfiles

```bash
cd ~
ln -s ~/Code/dotenv/home/gemrc .gemrc
ln -s ~/Code/dotenv/home/gitconfig .gitconfig
ln -s ~/Code/dotenv/home/vimrc .vimrc
ln -s ~/Code/dotenv/home/inputrc .inputrc
ln -s ~/Code/dotenv/home/npmrc .npmrc
```

### Fish

```bash
cd ~
mkdir -p ~/.config/fish/conf.d
ln -s ~/Code/dotenv/home/fish/aliases.fish ~/.config/fish/conf.d/aliases.fish
ln -s ~/Code/dotenv/home/fish/config.fish ~/.config/fish/conf.d/config.fish
```

### Bash

```bash
cd ~
ln -s ~/Code/dotenv/home/bash/bash_profile .bash_profile
ln -s ~/Code/dotenv/home/bash/bashrc .bashrc
```

## Atom

I use [Atom](https://atom.io) as my editor and use the [sync-setting](https://atom.io/packages/sync-settings) package to sync via Github gists

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

For my editor usage I use **Meslo**, which is a customized version of Apple's Menlo typeface. Main differentiator is that it offers three different line-heights baked into the type, because back in the day, most terminal applications were oblivious to the importance of such a setting.

For terminal support of the bob the fish theme, I use a [patched version of Meslo](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo) from the [Nerd Fonts project](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo).

iTerm 2 has such a setting now, but I still prefer to use the **Meslo LG L DZ** at 12pts.

For more information look at this [blog post](http://mir.aculo.us/2010/10/12/the-long-search-for-a-terminal-font-is-over/).

The font files can be downloaded from GitHub here:

* [Meslo](https://github.com/andreberg/Meslo-Font/downloads)
* [Meslo Nerd patched](https://github.com/ryanoasis/nerd-fonts/releases)
