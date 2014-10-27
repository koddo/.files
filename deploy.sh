#!/usr/bin/env bash

echo "creating dir $backupdir"
cd "$(dirname "$0")"
backupdir=~/.files.backup
if [[ -e "$backupdir" ]] ; then
    i=2
    while [[ -e "$backupdir-$i" ]] ; do
        let i++
    done
    backupdir="$backupdir-$i"
fi
echo "creating dir $backupdir"
mkdir -p "$backupdir"

for file in $(ls -1 | grep -vE '(\..*|README\.md|deploy\.sh)') ; do
    echo "symlinking ~/.$file" 
    mv ~/."$file" "$backupdir" 2>/dev/null
    ln -s ~/.files/"$file" ~/."$file"
done




echo 'configuring'
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name 'Alex Scherbanov'
git config --global user.email 'alex@egotv.ru'
git config --global push.default simple

# TODO: move this to dedicated mac file
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock   # disable useless dashboard

# to avoid sudo when using npm install, added .npm_local/bin to PATH and .npmrc
mkdir -p ~/.npm_local


