# Vim mode
bindkey -v

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Git

## Copy a branch (including remotes) name to clipboard
## Requires: fzf
alias git_select="git branch -a | fzf | tr -d '[:space:]' | sed -E 's/remotes\/origin\///g' | pbcopy"

## Delete all merged local branches except `dev`, `main`, `master`, or current (*)
alias git_sweep="git branch --merged | grep -Ev '(^\\*|dev|main|master)' | xargs git branch -d "

## Create a new branch from a remote branch with the same name
function git_switch {
	git switch -c "$1" "origin/$1"
}
