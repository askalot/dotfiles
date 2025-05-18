# XDG base directory config
# https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_CONFIG_HOME="$HOME/.config"
# Vim mode

bindkey -v

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fd
export FZF_DEFAULT_COMMAND="fd --type file --color=always --strip-cwd-prefix --hidden --exclude .git"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --color=always --strip-cwd-prefix --hidden --exclude .git"

_fzf_compgen_path() {
	fd --color=always --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
	fd --color=always --type=d --hidden --exclude .git . "$1"
}

# Aliases
alias lg=lazygit
alias ld=lazydocker

## Eza
alias la="eza --all --group-directories-first --icons --long"
alias lt="eza --all --group-directories-first --icons --tree --git-ignore"
alias ll="eza --all --group-directories-first --icons --long --no-permissions --no-filesize --no-user --no-time --git"

## Git

### Copy a branch (including remotes) name to clipboard
### Requires: fzf
alias git_select="git branch -a | fzf | tr -d '[:space:]' | sed -E 's/remotes\/origin\///g' | pbcopy"

### Delete all merged local branches except `dev`, `main`, `master`, or current (*)
alias git_sweep="git branch --merged | grep -Ev '(^\\*|dev|main|master)' | xargs git branch -d "

### Create a new branch from a remote branch with the same name
git_switch() {
	git switch -c "$1" "origin/$1"
}

curl_json() {
	curl -s -H "Accept: application/json" "$1" | jq
}

