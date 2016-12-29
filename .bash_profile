#
# .bash_profile
#
# @author Michael Souza
#

# Custom prompt
export PS1="\[\e[1;30m\]\u\[\e[m\]@\[\e[1;30m\]\h\[\e[m\]:\[\e[0;2m\]\w\[\e[m\]\$ "

# Use colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations.
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/git/bin:$PATH

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Include bashrc file (if present).
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

