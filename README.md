# Base environment setup

This are the base config files and settings I use on my work and personal machines.

If you use Dropbox, it's also a nice way to keep all of your things in sync. *iTerm 2* works well with config file syncing over Dropbox. Just symlink the files as instructed below and you should be good to go.

## The Dock

Remove the annoying delay with Dock auto-hiding:

```bash
defaults write com.apple.Dock autohide-delay -float 0; killall Dock
```

## Screenshot location

I like to keep my Desktop clean, so let's change the default location where screenshots are saved:

```bash
mkdir ~/Screenshots
$ defaults write com.apple.screencapture location ~/Screenshots && killall SystemUIServer
```

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
brew install neovim
brew install imagemagick
brew install the_silver_searcher
brew install fd
brew install rbenv
brew install rbenv-gemset
brew install nodenv
brew install postgresql
brew install ffmpeg
brew install nmap
brew install fzf

# Heroku has its own tap
brew tap heroku/brew && brew install heroku
```

**Install the Fish shell**

```bash
curl -L https://get.oh-my.fish | fish
sudo echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish
omf install rbenv
omf install nodenv
omf install bobthefish
omf install https://github.com/mihar/fzf
```

**Install OS X apps**

```bash
brew cask install visual-studio-code # Primary code editor
brew cask install fork # Visual Git client
brew cask install brave-browser # Privacy centric fork of Chrome with built-in Tor
brew cask install slack # New age IRC
brew cask install telegram # Privacy focused IM
brew cask install spotify # Tunes
brew cask install numi # Quick maffs
brew cask install iterm2 # Fully featured terminal emulator for OS X
brew cask install docker # Containerization for dependencies and production simulation
brew cask install shifty # Automate dark mode based on time of day
brew cask install lunar # Control external displays
brew cask install spectacle # Window resizing with keyboard
brew cask install istat-menus # System monitoring tooling in OS X menu bar
brew cask install bartender # Clean up your menu bar by hiding non-essential items
brew cask install cleanmymac # Paid app for cache cleaning, app updating and other performance tweaks
brew cask install sonos # Sound system if you have Sonos speakers
```

## SSH

Create a new key:

```bash
ssh-keygen -t rsa -C "your_email@example.com"
```

## Safari extensions

- [1Blocker](https://apps.apple.com/us/app/id1107421413) for tracker and ad blocking
- [1Password](https://1password.com/downloads/mac/) for password management
- [Dark Reader](https://itunes.apple.com/us/app/dark-reader-for-safari/id1438243180) for night
- [Stop the Madness](https://itunes.apple.com/app/stopthemadness/id1376402589?mt=12) to prevent annoying JavaScript
- [sVim](https://safari-extensions.apple.com/details/?id=com.flipxfx.svim-6Q2K7JYUZ6) for Vim-like navigation

### sVim configuration

For `sVimrc` load the gist `5341a0a533f7af55af598209e980efa2`.
For `sVimcss` load the gist `842ac422e7ead649f9a946cdd2e12bde`.

## dotfiles

```bash
cd ~
ln -s ~/Code/dotenv/home/gemrc .gemrc
ln -s ~/Code/dotenv/home/gitconfig .gitconfig
mkdir -p ~/.config/nvim
ln -s ~/Code/dotenv/home/init.vim ~/.config/nvim/init.vim
ln -s ~/Code/dotenv/home/inputrc .inputrc
ln -s ~/Code/dotenv/home/npmrc .npmrc
ln -s ~/Code/dotenv/home/sshconfig ~/.ssh/config
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

## VS Code

I use [VS Code](https://code.visualstudio.com/) as my editor and use the [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) package to sync via Github gists.

Since I use Vim mode in VS Code, one handy setting is also turning off letter accent suggestings on pressing, which makes it possible to hold `h`, `j`, `k`, `l` and others and it'll repeat the motion.

```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

## NeoVim

Lets link nvim to vim for less hassle:

```bash
ln -s /usr/local/bin/nvim /usr/local/bin/vim
```

Now install [vim-plug](https://github.com/junegunn/vim-plug):

```bash
mkdir -p ~/.config/nvim/autoload
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > ~/.config/nvim/autoload/plug.vim
vim +PlugInstall +qall
```

**Some of the plugins that you get:**

* spacegray color scheme
* fzf
* ack
* fugitive
* ruby
* javascript

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
