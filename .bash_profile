#
# .bash_profile
#
# @author Michael Souza
#

# Custom prompt
function set_prompt() {
	# COLOR - XY
	# X - { Foreground = 3, Background = 4 }
	# Y - { Black = 0, Red = 1, Green = 2, Yellow = 3, Blue = 4, Magenta = 5, Cyan = 6, White = 7 }
	# STYLE - { Normal = 0, Bold = 1 }
	# "\e[COLORm" - Start color prompt
	# "\e[STYLE;COLORm" - Start color prompt
	# "\e[m" - Reset color prompt
	# "\[" - Start non-printing characters
	# "\]" - End non-printing characters
	local START="\["
	local END="\]"
	local DIM="${START}\e[0;2m${END}"
  local START_COLOR="${START}\e["
	local END_COLOR="m${END}"
	local RESET_COLOR="${START}\e[m${END}"
	local BOLD_BLACK="1;30"
	local RED="31"
	local GIT_STATUS="\$(parse_git_branch)"

	export PS1="${START_COLOR}${BOLD_BLACK}${END_COLOR}\u${RESET_COLOR}@${START_COLOR}${BOLD_BLACK}${END_COLOR}\h${RESET_COLOR}:${DIM}\w ${START_COLOR}${RED}${END_COLOR}${GIT_STATUS}${RESET_COLOR}\$ "
}
set_prompt

# Use CLI colors and set LS command colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations.
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/git/bin:$PATH

# Include alias file (af present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Include bashrc file (if present).
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Turn on Git autocomplete.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Parse Git branch to show in custom prompt
if $(type git &> /dev/null); then
	# Parse current Git repository branch
	function parse_git_branch() {
		BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
		if [ ! "${BRANCH}" == "" ]; then
			STAT=$(parse_git_dirty)
			echo "(${BRANCH}${STAT})"
		else
			echo ""
		fi
	}

	# Parse current Git repository status
	function parse_git_dirty {
		STATUS=$(git status 2>&1 | tee)
		DIRTY=$(echo -n "${STATUS}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?")
		UNTRACKED=$(echo -n "${STATUS}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
		AHEAD=$(echo -n "${STATUS}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
		NEWFILE=$(echo -n "${STATUS}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
		RENAMED=$(echo -n "${STATUS}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
		DELETED=$(echo -n "${STATUS}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")
		BITS=''
		if [ "${RENAMED}" == "0" ]; then
			BITS=">${BITS}"
		fi
		if [ "${AHEAD}" == "0" ]; then
			BITS="*${BITS}"
		fi
		if [ "${NEWFILE}" == "0" ]; then
			BITS="+${BITS}"
		fi
		if [ "${UNTRACKED}" == "0" ]; then
			BITS="?${BITS}"
		fi
		if [ "${DELETED}" == "0" ]; then
			BITS="x${BITS}"
		fi
		if [ "${DIRTY}" == "0" ]; then
			BITS="!${BITS}"
		fi
		if [ ! "${BITS}" == "" ]; then
			echo " ${BITS}"
		else
			echo ""
		fi
	}
fi
