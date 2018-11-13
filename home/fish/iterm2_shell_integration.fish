# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

if begin; status --is-interactive; and not functions -q -- iterm2_status; and [ "$ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX""$TERM" != screen ]; end
  function iterm2_status
    printf "\033]133;D;%s\007" $argv
  end

  # Mark start of prompt
  function iterm2_prompt_mark
    printf "\033]133;A\007"
  end

  # Mark end of prompt
  function iterm2_prompt_end
    printf "\033]133;B\007"
  end

  # Tell terminal to create a mark at this location
  function iterm2_preexec
    # For other shells we would output status here but we can't do that in fish.
    printf "\033]133;C;\007"
  end

  # Usage: iterm2_set_user_var key value
  # These variables show up in badges (and later in other places). For example
  # iterm2_set_user_var currentDirectory "$PWD"
  # Gives a variable accessible in a badge by \(user.currentDirectory)
  # Calls to this go in iterm2_print_user_vars.
  function iterm2_set_user_var
    printf "\033]1337;SetUserVar=%s=%s\007" "$argv[1]" (printf "%s" "$argv[2]" | base64 | tr -d "\n")
  end

  # iTerm2 inform terminal that command starts here
  function iterm2_precmd
    printf "\033]1337;RemoteHost=%s@%s\007\033]1337;CurrentDir=%s\007" $USER $iterm2_hostname $PWD

    # Users can define a function called iterm2_print_user_vars.
    # It should call iterm2_set_user_var and produce no other output.
    if functions -q -- iterm2_print_user_vars
      iterm2_print_user_vars
    end

  end

  function underscore_change -v _
    if [ x$_ = xfish ]
      iterm2_precmd
    else
      iterm2_preexec
    end
  end

  # If hostname -f is slow for you, set iterm2_hostname before sourcing this script
  if not set -q iterm2_hostname
    set iterm2_hostname (hostname -f 2>/dev/null)
    # some flavors of BSD (i.e. NetBSD and OpenBSD) don't have the -f option
    if test $status -ne 0
      set iterm2_hostname (hostname)
    end
  end

  iterm2_precmd
  printf "\033]1337;ShellIntegrationVersion=6;shell=fish\007"
end
alias imgcat=~/.iterm2/imgcat;alias imgls=~/.iterm2/imgls;alias it2attention=~/.iterm2/it2attention;alias it2check=~/.iterm2/it2check;alias it2copy=~/.iterm2/it2copy;alias it2dl=~/.iterm2/it2dl;alias it2getvar=~/.iterm2/it2getvar;alias it2setcolor=~/.iterm2/it2setcolor;alias it2setkeylabel=~/.iterm2/it2setkeylabel;alias it2ul=~/.iterm2/it2ul;alias it2universion=~/.iterm2/it2universion
