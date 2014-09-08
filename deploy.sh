#!/usr/bin/env bash

if [[ $1 != "NOW" ]]; then
    echo "usage: ./deploy.sh NOW"
    echo
    echo "will also ~/.files.backup"
    exit 1
fi



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

for file in `ls -1 | grep -vE '(\..*|README\.md|deploy\.sh)'` ; do
    echo "symlinking ~/.$file" 
    mv ~/.$file "$backupdir" 2>/dev/null
    ln -s ~/.files/$file ~/.$file
done




echo 'my customs'
git config --global core.excludesfile ~/.gitignore_global

