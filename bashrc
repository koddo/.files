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
alias gdc="git diff --cached"
alias ga='git add'
alias gaa="git add --all"
alias gc="f() { git commit -m \"\$*\"; }; f"
alias gca="f() { git commit -a -m \"\$*\"; }; f"
alias gcemptymessage="git add --all && git commit --allow-empty-message -am '' && git push && echo '--- ok ---'  ; tell_when_done.sh"


alias ec="emacsclient -n"

bind "\C-t":forward-search-history


# TODO: cross-platform
# export WORKON_HOME=~/.python_virtualenvs
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv-2.7
# export VIRTUAL_ENV_DISABLE_PROMPT=1   # I use customized indication, see below
source_when_exists () {
    [[ -f "$1" ]] && source "$1"
}
MY_DEFAULT_PYTHON=default3
# source_when_exists /opt/local/bin/virtualenvwrapper.sh-2.7
# source_when_exists ~/.python_virtualenvs/$MY_DEFAULT_PYTHON/bin/activate
source_when_exists ~/.python_venv/$MY_DEFAULT_PYTHON/bin/activate
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
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# . ~/.kerl_erlang/17.5/activate

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


## https://stackoverflow.com/questions/7171725/open-new-terminal-tab-from-command-line-mac-os-x/8188174#8188174
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}

# collect events for INTERVAL amount of time and then fire them all at once
# well, not really
# it's a naive implementation that does the job for me:
# $ fswatch --one-per-batch --exclude '\.git' . | debounce 300 | while read ; do git commit ... ; done
function debounce() {    
    local INTERVAL LINE
    INTERVAL="$1"
    
    while IFS='' read -r LINE || [[ -n "$LINE" ]] ; do
        if [[ -z $(jobs -rp) ]]; then
            (
                sleep "$INTERVAL"
                echo "$LINE"
            ) &
        fi
    done
}

function firefox-window() {
/usr/bin/env osascript <<-EOF
tell application "System Events"
    if (name of processes) contains "Firefox" then
        tell application "Firefox" to activate
        keystroke "n" using command down
    else
        tell application "Firefox" to activate
    end if
end tell
EOF
}
