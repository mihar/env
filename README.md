# Base environment setup

This are the base config files and settings I use on my work and personal machines.

If you use Dropbox, it's also a nice way to keep all of your things in sync. *iTerm 2* works well with config file syncing over Dropbox. Just symlink the files as instructed below and you should be good to go.

## Key features

- VIM everywhere (NeoVim obviously, VS Code, Fish shell, Safari)
- GPG through Keybase
- Good typography
- OS X light/dark theme respected in VS Code, iTerm, bat, delta
- TBC

Here's how my editor looks like:

<img width="1680" alt="Screen Shot 2019-08-29 at 4 04 44 PM" src="https://user-images.githubusercontent.com/5446/63982337-f82a8a80-ca76-11e9-94e1-77f4fd4b9e44.png">

Here's how my terminal looks like:

<img width="850" alt="Screen Shot 2019-08-29 at 4 03 43 PM" src="https://user-images.githubusercontent.com/5446/63982365-0a0c2d80-ca77-11e9-8cea-b7556da9b141.png">

## The Dock

Remove the annoying delay with Dock auto-hiding:

```bash
defaults write com.apple.Dock autohide-delay -float 0; killall Dock
```

## Reduce animations

To make things appear snappier, remove unnecessary animations:

```bash
defaults write com.apple.dock expose-animation-duration -float 0
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
brew install delta
brew install bat
brew install git
brew install wget
brew install neovim
brew install imagemagick
brew install the_silver_searcher
brew install fd
brew install rbenv
brew install rbenv-gemset
brew install nodenv
brew install yarn
brew install postgresql
brew install redis
brew install ffmpeg
brew install nmap
brew install fzf
brew install tree
brew install nnn
brew install geckodriver

# GPG
brew install gpg
brew install pinentry-mac

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
brew cask install firefox # Standards based browser good for full feature specs
brew cask install slack # New age IRC
brew cask install telegram # Privacy focused IM
brew cask install spotify # Tunes
brew cask install numi # Quick maffs
brew cask install iterm2 # Fully featured terminal emulator for OS X
brew cask install docker # Containerization for dependencies and production simulation
brew cask install paw # Powerful API inspector and explorer
brew cask install lunar # Control external displays
brew cask install spectacle # Window resizing with keyboard
brew cask install istat-menus # System monitoring tooling in OS X menu bar
brew cask install bartender # Clean up your menu bar by hiding non-essential items
brew cask install cleanmymac # Paid app for cache cleaning, app updating and other performance tweaks
brew cask install alfred # Replacement for the default spotlight Cmd+Space
brew cask install witch # Replacement for the default Opt+Tab switcher
brew cask install keybase # GPG social network

# Sonos
brew tap homebrew/cask-drivers
brew cask install sonos # Sound system if you have Sonos speakers
```

## SSH

Create a new key if you need it:

```bash
ssh-keygen -t rsa -C "your_email@example.com"
```

## GPG

Let's setup GPG for commit signing and other shenanigans.

### Keybase

Keybase is a great way to start using GPG, they'll generate your keys and host them for you.

If you don't yet have an account, go to [https://keybase.io](https://keybase.io) and create it.

Then login on your computer and the `keybase id` command should output your data.

```bash
keybase login
keybase id
```

#### Making Keybase behave

Keybase by default installs a lot of crap you probably don't need. A slow JS-based UI, Fuse encrypted networking, chats, etc.

The following will trim all the fat and leave the good: CLI.

```bash
/Applications/Keybase.app/Contents/SharedSupport/bin/keybase install -c cli
keybase ctl stop
keybase uninstall -c fuse
keybase uninstall -c helper
keybase uninstall -c kbfs
keybase uninstall -c service
keybase uninstall -c updater
sudo pkill -TERM keybase.Helper
sudo rm -f /Library/LaunchDaemons/keybase.Helper.plist
sudo rm -f /Library/PrivilegedHelperTools/keybase.Helper
```

An essential step is also aliasing the `keybase` command to `keybase --standalone`, which will stop complaining about the agent not running in the background.

This is accomplished in the `aliases.fish` file, so you don't need to do it.

As a final step, let's make Keybase use the `pinentry-mac` so our passwords can be securely stored in the OS X Keychain.

```bash
keybase config set pinentry.path /usr/local/bin/pinentry-mac
```

#### If you don't have a GPG key yet

Let's create a new key on Keybase specifically for use in GPG on our computer.

```bash
keybase pgp gen --multi
```

#### If you have a GPG key already

If you have your key on another machine, you can run `keybase pgp export` to see all the available keys to you.
Otherwise skip to the [Importing existing GPG key].

```bash
$ keybase pgp export
# ▶ WARNING Found several matches:
# user: Miha Rebernik <miha@rebernik.info>
# 4096-bit RSA key, ID 6B997648324AF29E, created 2019-08-19
```

Now export it with (it'll ask you for a password with which to encrypt it, you should add it):

```bash
keybase pgp export -q 6B997648324AF29E -s > pgp_key
```

Now get your `pgp_key` file to the new machine where you're setting GPG up.

##### Importing existing GPG key

Run this command to import the private key into Keybase first, and then into GPG.

This will first ask you for the password you used to encrypt this key, so it can decrypt it and import it.
Then it will also ask you for a password with which to securely store the key on your machine. This password
will be needed every time you try to use this key to sign or decrypt something (it will later be handled transparently by `pinentry-mac`).

```bash
keybase pgp import -i pgp_key
keybase pgp export -q 6B997648324AF29E --secret | gpg --allow-secret-key-import --import
```

### Setting GPG and Git

Now we'll list available keys and set the default key for Git

```bash
$ gpg --list-secret-keys --keyid-format LONG
# /Users/mihar/.gnupg/pubring.kbx
# -------------------------------
# sec   rsa4096/6B997648324AF29E 2019-08-19 [SC] [expires: 2035-08-15]
# uid                 [ unknown] Miha Rebernik <miha@rebernik.info>
# ssb   rsa4096/BB08A4DB17E7EC97 2019-08-19 [E] [expires: 2035-08-15]

$ git config --global user.signingkey 6B997648324AF29E
$ git config --global commit.gpgsign true
```

If you need to add the key to Github or anywhere else, you can use this command:

```bash
keybase pgp export -q 6B997648324AF29E | pbcopy
```

Now link the config files in this repo:

```bash
ln -s ~/Code/dotenv/home/gpg.conf ~/.gnupg/gpg.conf
ln -s ~/Code/dotenv/home/gpg-agent.conf ~/.gnupg/gpg-agent.conf
```

And restart the GPG agent:

```bash
gpgconf --kill gpg-agent
```

### Testing GPG

Test everything works as needed by doing:

```bash
echo "testing GPG" | gpg --clearsign
```

You should see no errors and a plaintest message you've inputted along with a signature.

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
ln -s ~/Code/dotenv/home/gpg.conf ~/.gnupg/gpg.conf
ln -s ~/Code/dotenv/home/gpg-agent.conf ~/.gnupg/gpg-agent.conf
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

## Install all software updates

```bash
softwareupdate -i -a
```

## iTerm 2

iTerm has a nice convenient way of overriding which directory houses your settings.

![](http://i.imgur.com/pwGCOrj.png)

Then we need to link the theme change script to it's AutoLaunch directory.

```bash
mkdir -p ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
ln -s ~/Code/dotenv/iterm2/theme_switch.py ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/theme_switch.py
```

## Font

For my editor usage I use **Meslo**, which is a customized version of Apple's Menlo typeface. Main differentiator is that it offers three different line-heights baked into the type, because back in the day, most terminal applications were oblivious to the importance of such a setting.

For terminal support of the bob the fish theme, I use a [patched version of Meslo](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo) from the [Nerd Fonts project](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo).

iTerm 2 has such a setting now, but I still prefer to use the **Meslo LG L DZ** at 12pts.

For more information look at this [blog post](http://mir.aculo.us/2010/10/12/the-long-search-for-a-terminal-font-is-over/).

The font files can be downloaded from GitHub here:

* [Meslo](https://github.com/andreberg/Meslo-Font/downloads)
* [Meslo Nerd patched](https://github.com/ryanoasis/nerd-fonts/releases)
