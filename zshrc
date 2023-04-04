#!/usr/bin/env zsh

################################################################################
# oh-my-zsh
#

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

ZSH_THEME="agnoster" # TODO figure out how to get spaceship to work on wsl ubuntu
zstyle ':omz:update' mode auto      # update automatically without asking

source $HOME/.config/oh-my-zsh/plugins.sh
source $HOME/.config/oh-my-zsh/oh-my-zsh.sh
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

################################################################################
# SSH
#

# https://stackoverflow.com/questions/40549332/how-to-check-if-ssh-agent-is-already-running-in-bash/48509425#48509425

# Ensure agent is running
ssh-add -l &>/dev/null
if [ "$?" -eq 2 ]; then
    # Could not open a connection to your authentication agent.
    echo "ssh-agent not found for this session"

    # Load stored agent connection info.
    test -r ~/.ssh-agent && \
        eval "$(<~/.ssh-agent)" >/dev/null

    ssh-add -l &>/dev/null
    if [ "$?" -eq 2 ]; then
        # Start agent and store agent connection info.
        echo "ssh-agent started"

        (umask 066; ssh-agent > ~/.ssh-agent)
        eval "$(<~/.ssh-agent)" >/dev/null
    else
        echo "ssh-agent connected"
    fi
else
    echo "ssh-agent found"
fi


function refre-ssh() {
    echo "Loading ssh all ssh identities in ~/.ssh/"

    grep -slR "PRIVATE" ~/.ssh/ | xargs ssh-add
}

ssh-add -l &>/dev/null
if [ "$?" -eq 1 ]; then
    refre-ssh
fi


################################################################################
# git
#
function git-clean-branches() {
    git fetch -p

    GONE_BRANCHES=$(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}')
    while IFS= read -r GONE_BRANCH; do
        git branch -D $GONE_BRANCH;
    done <<< "$GONE_BRANCHES"
}

alias git-amend="git commit --amend --no-edit"

git-tag () {
    git tag -d $1 > /dev/null 2>&1
    git push --delete origin $1 > /dev/null 2>&1
    git tag -a $1 -m $1 > /dev/null 2>&1
}

git-purge-tags () {
    for TAG in `git tag -l`; do 
        git tag -d $TAG > /dev/null 2>&1;
    done
}

################################################################################
# aws
#
alias aws-login="yawsso auto --this --profile"

