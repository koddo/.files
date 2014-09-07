#!/usr/bin/env bash

### deploy org-mode --- remove this
# mkdir -p emacs.d/elisp/
# cd elisp/
# git clone git://orgmode.org/org-mode.git
# cd org-mode/
# echo 'EMACS	= /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs' >> local.mk   # TODO: preinit --- must depend on a symlink to this machine local config 
# git checkout -b stable origin/maint   # http://orgmode.org/worg/org-faq.html -- How can I use a stable release version instead of the bleeding edge master?
# make up1   # http://orgmode.org/worg/dev/org-build-system.html


dotfiles="$(dirname "$0")"
cd $dotfiles
mkdir -p ~/$dotfiles.backup


for file in `ls -1 | grep -vE '(\..*|README\.md|deploy\.sh)'` ; do 
    echo $file
    # mv -v ~/.$file ~/$dotfiles.backup/ 2>/dev/null || true   # for a case if 'set -e'
    # ln -s $dotfiles/$file ~/.$file
done




# git config --global core.excludesfile ~/.gitignore_global

