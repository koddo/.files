# -*- mode: shell-script -*-

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=5000
export HISTFILESIZE=100000
shopt -s histappend

# export CLICOLOR=1

alias ls="ls -Fh"
alias ll="ls -al | less"
alias ..="cd .."
alias ~="cd ~"
alias du="du -h"
alias mkdir="mkdir -pv"
alias vi="vim"
alias historyrepeating="history -a; history -c; history -r"
alias btt_restart="osascript -e 'tell application \"BetterTouchTool\" to quit' && open -a BetterTouchTool"
alias bgt="bg; wait; tell_when_done.sh"

alias gs="git status"
alias gaa="git add --all"

# TODO: cross-platform
export WORKON_HOME=~/.python_virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv-2.7
source /opt/local/bin/virtualenvwrapper.sh-2.7
# source .python_virtualenvs/default/bin/activate
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

export PS1="\w\$ "

export HISTTIMEFORMAT="%d/%m/%Y %T "

# TODO: cross-platform
export ANDROID_HOME=~/Development/adt-bundle-mac-x86_64-20140702/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:~/.bin_local
. ~/.kerl_erlang/17.1/activate

docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
