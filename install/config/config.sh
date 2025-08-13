#!/bin/bash

# Copy over grayhat configs
cp -R ~/.local/share/grayhat/config/* ~/.config/

# Use default bashrc from grayhat
cp ~/.local/share/grayhat/default/bashrc ~/.bashrc

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# If bare install, allow a way for its exclusions to not get added in updates
if [ -n "$GRAYHAT_BARE" ]; then
  mkdir -p ~/.local/state/grayhat
  touch ~/.local/state/grayhat/bare.mode
fi

# Setup GPG configuration with multiple keyservers for better reliability
sudo mkdir -p /etc/gnupg
sudo cp ~/.local/share/grayhat/default/gpg/dirmngr.conf /etc/gnupg/
sudo chmod 644 /etc/gnupg/dirmngr.conf
sudo gpgconf --kill dirmngr || true
sudo gpgconf --launch dirmngr || true

# Increase lockout limit to 10 and decrease timeout to 2 minutes
sudo sed -i 's|^\(auth\s\+required\s\+pam_faillock.so\)\s\+preauth.*$|\1 preauth silent deny=10 unlock_time=120|' "/etc/pam.d/system-auth"
sudo sed -i 's|^\(auth\s\+\[default=die\]\s\+pam_faillock.so\)\s\+authfail.*$|\1 authfail deny=10 unlock_time=120|' "/etc/pam.d/system-auth"

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.remotes "remote -v"
git config --global alias.a "add --interactive"

git config --global alias.pu "!f() { git push -u upstream --tag $1; }; f"
git config --global alias.puf "!f() { git push -f -u upstream --tag $1; }; f"
git config --global alias.po "!f() { git push -u origin --tag $1; }; f"
git config --global alias.pof "!f() { git push -f -u origin --tag $1; }; f"
git config --global alias.up "!f() { git fetch upstream && git merge upstream/$1; }; f"
git config --global alias.sup "!f() { git fetch --recurse-submodules upstream && git merge upstream/$1; }; f"
git config --global alias.op "!f() { git fetch origin && git merge origin/$1; }; f"
git config --global alias.sop "!f() { git fetch --recurse-submodules origin && git merge origin/$1; }; f"
git config --global alias.do "!f() { git branch -D $1 && git branch -D -r origin/$1; }; f"
git config --global alias.du "!f() { git branch -D $1 && git branch -D -r upstream/$1; }; f"
git config --global alias.pr "!f() { git fetch origin pull/$1/head:pr-$1 && git checkout pr-$1; }; f"
git config --global alias.pur "!f() { git fetch upstream pull/$1/head:pr-$1 && git checkout pr-$1; }; f"
git config --global alias.ls "!f() { git branch -l -r; }; f"
git config --global alias.lga "log --graph --oneline --all --decorate"

git config --global core.editor "/usr/bin/env nvim"

git config --global color.branch auto
git config --global color.status auto
git config --global color.diff auto
git config --global color.ui auto
git config --global apply.whitespace fix
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default
git config --global i18n.filesEncoding utf-8
git config --global pull.rebase true
git config --global init.defaultBranch master

# add delta
yay -S --noconfirm --needed git-delta

git config --global core.pager delta
git config --global interactive.diffFilter = "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true

# Set identification from install inputs
if [[ -n "${GRAYHAT_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$GRAYHAT_USER_NAME"
fi

if [[ -n "${GRAYHAT_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$GRAYHAT_USER_EMAIL"
fi

git config --global user.signingkey 'if [[ -f "~/.ssh/id_rsa.pub" ]]; then KEY=`cat ~/.ssh/id_rsa.pub`; else KEY=''; fi; $KEY'

# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/grayhat/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$GRAYHAT_USER_NAME"
<Multi_key> <space> <e> : "$GRAYHAT_USER_EMAIL"
EOF
