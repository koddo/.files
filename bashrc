# -*- mode: shell-script -*-

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=5000
export HISTFILESIZE=100000
export HISTTIMEFORMAT="%d/%m/%Y %T "
shopt -s histappend

# export CLICOLOR=1

alias ls="ls -Fh"
alias ll="ls -al | less"
alias ..="cd .."
alias ~="cd ~"
alias du="du -h"
alias mkdir="mkdir -pv"
alias vi="vim"
alias bc="bc -l"
alias historyrepeating="history -a; history -c; history -r"
alias btt_restart="osascript -e 'tell application \"BetterTouchTool\" to quit' && open -a BetterTouchTool"
alias bgt="bg; wait; tell_when_done.sh"
alias fgt="fg; tell_when_done.sh"
alias github-create-repo.sh='. github-create-repo.sh'

alias gs="git status"
alias gd="git diff"
alias ga='git add'
alias gaa="git add --all"

alias ec="emacsclient -n"

bind "\C-t":forward-search-history


# TODO: cross-platform
export WORKON_HOME=~/.python_virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv-2.7
export VIRTUAL_ENV_DISABLE_PROMPT=1   # I use customized indication, see below
source_when_exists () {
    [[ -f "$1" ]] && source "$1"
}
MY_DEFAULT_PYTHON=default360
source_when_exists /opt/local/bin/virtualenvwrapper.sh-2.7
source_when_exists ~/.python_virtualenvs/$MY_DEFAULT_PYTHON/bin/activate
# source_when_exists ~/.pythonz/etc/bashrc
function virtualenv_name() {
    VENV="${VIRTUAL_ENV##*/}"      # strip out the path and just leave the env name
    if [[ -n "$VENV" ]]; then
        [[ "$VENV" != "$MY_DEFAULT_PYTHON" ]] && echo "($VENV) "
    else
        echo '(no_venv)'
    fi
}

export PS1="$(virtualenv_name)\w\$ "     # same as in ~/.python_virtualenvs/postactivate

export PATH=$PATH:~/.bin_local


# TODO: cross-platform
# export ANDROID_HOME=~/Development/adt-bundle-mac-x86_64-20140702/sdk
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# . ~/.kerl_erlang/17.5/activate

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



