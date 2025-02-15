# Nicer grep
alias grep='grep --color'

# Git commands
alias gs='git status'
alias gp='git pull origin master'
alias gpo='git pull --rebase origin master'
alias gpr='git pull --rebase'
alias gpu='git push'
alias gpuf='git push --force-with-lease'
alias gr='git rebase'
alias grc='git rebase --continue'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gb='git branch'
alias gbd='git branch -D'
alias gm='git checkout master'
alias gnb='git checkout -b'
alias gck='git checkout'
alias gd='git diff'
alias gdo='git diff origin/master'
alias gl='git log'
alias gstsh='git stash'
alias gstshl='git stash list'
alias gstshp='git stash pop'
alias gstshd='git stash drop'
alias clean_branches="git branch --merged master | grep -v 'master\$' | xargs git branch -d"

function gpun
  git push --set-upstream origin (git branch | grep \* | cut -d ' ' -f2)
end

alias lg='lazygit'
alias ldk='lazydocker'

# Docker
function docker_cleanup_containers
  docker rm (docker ps -a -q)
end
function docker_cleanup_images
  docker rmi (docker images | grep "^<none>" | awk '{print $3}')
end

# A cat 🐈 is a bat 🦇
alias cat='bat --theme=(defaults read -globalDomain AppleInterfaceStyle 1>/dev/null 2>&1 && echo TwoDark || echo OneHalfLight)'
alias delta='delta --syntax-theme=(defaults read -globalDomain AppleInterfaceStyle 1>/dev/null 2>&1 && echo TwoDark || echo OneHalfLight)'

# Weather forecast
alias weather='curl "wttr.in/?m"'

# Helper functions
function ..
    cd ..
end

# Make Keybase chill out with a CLI only installation
alias keybase='keybase --standalone'
