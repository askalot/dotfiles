#!/bin/sh

# Helpers
get_latest_github_release_url() {
  # requires: curl, jq
  #GITHUB_REPO=$1
  #FILE_EXTENSION=$2

  curl --silent "https://api.github.com/repos/$1/releases/latest" | jq --raw-output ".assets[] | select(.name | endswith(\"$2\")) | .browser_download_url"
}

# Update DNF
sudo dnf update

# DNF packages

## CLI

### bat
# sudo dnf install bat -y

### delta
# sudo dnf install git-delta -y

### fd
# sudo dnf install fd-find -y

### fish
# sudo dnf install fish -y

### fzf
# sudo dnf install fzf -y

### glow
# sudo dnf install glow -y

### gum
# sudo dnf install gum -y

### Helix
# sudo dnf install helix -y

### Lazygit
# sudo dnf copr enable atim/lazygit -y
# sudo dnf install lazygit -y

### lsd
# sudo dnf install lsd -y
# mkdir -p "$HOME/.config/lsd"

### ripgrep
# sudo dnf install ripgrep -y

### Starship
# sudo dnf copr enable atim/starship -y
# sudo dnf install starship -y
# echo "starship init fish | source" >> "$HOME/.config/fish/config.fish"

### tmux
# mkdir -p "$HOME/.config/tmux"

### yazi
# sudo dnf copr enable lihaohong/yazi -y
# sudo dnf install yazi -y

### zoxide
# sudo dnf install zoxide -y
# echo "zoxide init --cmd cd fish | source" >> "$HOME/.config/fish/config.fish"

## Fonts
# sudo dnf install jetbrains-mono-fonts-all -y

## GUI

### Alacritty
# sudo dnf install alacritty -y
# mkdir -p "$HOME/.config/alacritty"

### Beekeeper Studio
# sudo curl -o /etc/yum.repos.d/beekeeper-studio.repo https://rpm.beekeeperstudio.io/beekeeper-studio.repo
# sudo rpm --import https://rpm.beekeeperstudio.io/beekeeper.key
# sudo dnf install beekeeper-studio -y

### Gimp
# sudo dnf install gimp -y

### Inkscape
# sudo dnf install inkscape -y

### Yaak: Unsure
# TODO: Handle already installed
# LATEST_YAAK=$(get_latest_github_release_url "mountain-loop/yaak" ".rpm")
# sudo dnf install $LATEST_YAAK -y

# sudo dnf install rdfind -y

## Flatpak

### Podman
# flatpak install flathub com.belmoussaoui.Authenticator -y
# flatpak install flathub org.gnome.Builder -y
# flatpak install flathub nl.hjdskes.gcolor3 -y
# flatpak install flathub com.github.geigi.cozy -y
# flatpak install flathub com.github.johnfactotum.Foliate -y
# flatpak install flathub dev.bragefuglseth.Keypunch -y
# flatpak install flathub io.gitlab.news_flash.NewsFlash -y
# flatpak install flathub org.gnome.Podcasts -y
# flatpak install flathub io.podman_desktop.PodmanDesktop -y
# flatpak install flathub me.iepure.Ticketbooth -y
# flatpak install flathub re.sonny.Workbench -y
# flatpak install flathub app.zen_browser.zen -y
# flatpak install flathub org.gnome.World.Secrets -y
# flatpak install flathub org.localsend.localsend_app -y

### Unsure
# flatpak install flathub com.brave.Browser -y
# flatpak install flathub dev.zed.Zed -y
# flatpak install flathub org.freedesktop.Sdk.Extension.vala/x86_64/24.08 -y
# flatpak install flathub org.gnome.Sdk.Docs/x86_64/48 -y
# flatpak install flathub org.videolan.VLC -y
# flatpak install flathub org.kde.kdenlive -y
# flatpak install flathub org.gnome.Shotwell -y

## mise-en-place

# sudo dnf config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo
# sudo dnf install mise -y
# echo "mise activate fish | source" >> "$HOME/.config/fish/config.fish"

### Go
# mise use -g go@latest
# go install golang.org/x/tools/gopls@latest # LSP
# go install github.com/go-delve/delve/cmd/dlv@latest # Debugger
# go install golang.org/x/tools/cmd/goimports@latest # Formatter
# go install github.com/nametake/golangci-lint-langserver@latest # Linter
# go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest # Linter CLI
# go install github.com/air-verse/air@latest

### Bun
# mise use -g bun@latest

### Node.js
# mise use -g node@latest
# npm install -g typescript typescript-language-server
# npm install -g vscode-langservers-extracted
# npm install -g fish-lsp
#### Bash LSP
# npm install -g bash-language-server
# sudo dnf install shellcheck -y
# sudo dnf install shfmt -y

## Custom
# echo '[charm]
# name=Charm
# baseurl=https://repo.charm.sh/yum/
# enabled=1
# gpgcheck=1
# gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
# sudo yum install glow

## Config

# echo "fastestmirror=1" >> /etc/dnf/dnf.conf
# echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf

## SSH
setup_ssh_keys() {
  SSH_CONFIG_DIRECTORY="$HOME/.ssh"
  SSH_KEYS_NAME="id_$1"
  SSH_KEYS_PATH="$SSH_CONFIG_DIRECTORY/$SSH_KEYS_NAME"
  SSH_KEYS_EXIST="$(find "$SSH_CONFIG_DIRECTORY" -type f -name "$SSH_KEYS_NAME" | wc -l)"

  if [ ! "$SSH_KEYS_EXIST" -gt 0 ]; then
    mkdir -p "$SSH_CONFIG_DIRECTORY"
    ssh-keygen -t ed25519 -f "$SSH_KEYS_PATH" -C "$2"
    eval "$(ssh-agent -s)"
    ssh-add "$SSH_KEYS_PATH"
  else
    echo "SSH keys already exist. Doing nothing"
  fi
}

# setup_ssh_keys "github" "59402100+askalot@users.noreply.github.com"

# Input Sources
append_input_source() {
  CURRENT_INPUT_SOURCES=$(gsettings get org.gnome.desktop.input-sources sources)
  STRIPPED_SOURCES=$(printf "%s" "$CURRENT_INPUT_SOURCES" | sed 's/]$//')
  NEW_INPUT_SOURCES=$(printf "%s, ('%s', '%s')]" "$STRIPPED_SOURCES" "$1" "$2")

  gsettings set org.gnome.desktop.input-sources sources "$NEW_INPUT_SOURCES"
}

# append_input_source "ibus" "m17n:ta:phonetic"

get_vivaldi_version() {
  curl -s 'https://vivaldi.com/download/archive/?platform=linux' |
    grep --only-matching 'vivaldi-stable-[0-9.]*-1\.x86_64\.rpm' |
    head -1
}

# LATEST_VIVALDI=$(get_vivaldi_version)
# sudo dnf install "https://downloads.vivaldi.com/stable/$LATEST_VIVALDI" -y

# - Apostrophe
# - Komikku
# - epiphany
