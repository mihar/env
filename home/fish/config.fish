# Language and locale.
set -gx LANG en_US.UTF-8
set -gx LC_COLLATE en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_MESSAGES en_US.UTF-8
set -gx LC_MONETARY en_US.UTF-8
set -gx LC_NUMERIC en_US.UTF-8
set -gx LC_TIME en_US.UTF-8

# Editor settings
set -gx EDITOR vim
set -gx CVSEDITOR vim
set -gx SVN_EDITOR vim
set -gx GIT_EDITOR vim

# Set GPG TTY settings
set -gx GPG_TTY (tty)

# FZF setting to use fd instead of find
set -gx FZF_DEFAULT_COMMAND 'fd --type f'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Vim-like key bindings
fish_vi_key_bindings

# Set bobthefish theme
set -g theme_color_scheme gruvbox

# iTerm 2 integration
test -e ~/Code/dotenv/home/fish/iterm2_shell_integration.fish; and source ~/Code/dotenv/home/fish/iterm2_shell_integration.fish
