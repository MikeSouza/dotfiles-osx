#
# .bash_aliases
#
# @author Michael Souza
#

# ls aliases
alias la='ls -a'
alias lla='ls -la'

# Reload bash user profile
alias reload='source $HOME/.bash_profile'

# Git aliases
alias gits='git status'
alias gs='git status'
alias gitd='git diff'
alias gd='git diff'
alias gita='git add'
alias ga='git add'
alias gitc='git commit'
alias gc='git commit'
alias gitcm='git commit -m'
alias gcm='git commit -m'
alias gitp='git pull --rebase'
alias gp='git pull --rebase'
alias gitcam='git commit -am'
alias gcam='git commit -am'
alias gitl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# MacVim aliases to over built-in vi/vim
if type mvim &> /dev/null; then
  alias vi='mvim -v'
  alias vim='mvim -v'
fi
