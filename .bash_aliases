#
# .bash_aliases
#
# @author Michael Souza
#

# ls aliases
if type gls &> /dev/null; then
	alias ls='gls -FGh --group-directories-first --color=always'
else
	alias ls='ls -FGh'
fi
alias la='ls -a'
alias lla='ls -la'

# Reload bash user profile
alias reload='source $HOME/.bash_profile'

# Git aliases
alias gits='git status'
alias gs='gits'

alias gitd='git diff'
alias gd='gitd'

alias gita='git add'
alias ga='gita'

alias gitc='git commit'
alias gc='gitc'

alias gitcm='git commit -m'
alias gcm='gitcm'

alias gitp='git pull --rebase'
alias gp='gitp'

alias gitcam='git add . && git commit -am'
alias gcam='gitcam'

alias gitl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gl='gitl'

alias gitreset='git reset --hard "origin/$(git rev-parse --abbrev-ref HEAD)"'
alias greset='gitreset'

alias gitcp='git cherry-pick'
alias gcp='gitcp'

alias gitco='git checkout'
alias gco='gitco'

alias gitbdel='git branch -d -f' # git branch -D
alias gbdel='gitbdel'

# Git functions
function gitrewind() {
	local opts='--hard'
	local ncommits='1'
	if [ -z "$2" ]; then
	  ncommits="$1"
	else
		opts="$1"
		ncommits="$2"
	fi

	git reset ${opts} HEAD~${ncommits}
}

# NPM Aliases
alias npmlg='npm list -g --depth=0'

# MacVim aliases to over built-in vi/vim
if type mvim &> /dev/null; then
  alias vim='mvim -v'
  alias vi='vim'
fi
