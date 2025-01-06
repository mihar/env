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

# Update path for brew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# Remove universal settings for key bindings to avoid interference
set -U -e fish_key_bindings

if test "$TERM_PROGRAM" != "WarpTerminal"
  # FZF setting to use fd instead of find
  set -gx FZF_DEFAULT_COMMAND 'fd --type f'
  set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

  # Install autojump
  [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

  # Vim-like key bindings
  fish_vi_key_bindings

  # Set bobthefish theme
  set -g theme_color_scheme gruvbox

  # iTerm 2 integration
  test -e ~/Code/dotenv/home/fish/iterm2_shell_integration.fish; and source ~/Code/dotenv/home/fish/iterm2_shell_integration.fish

  else
    # Default key bindings for Warp Terminal
    fish_default_key_bindings
end

# The next line updates PATH for the Google Cloud SDK.
# set -gx CLOUDSDK_PYTHON '/usr/local/bin/python3'
# set -gx CLOUDSDK_GSUTIL_PYTHON '/usr/local/bin/python3'

if [ -f ~/Code/google-cloud-sdk/path.fish.inc ]; . ~/Code/google-cloud-sdk/path.fish.inc; end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# VS Code integration
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

# pnpm
set -gx PNPM_HOME "/Users/mihar/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
