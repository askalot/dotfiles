#!/bin/sh

setup_ssh_keys() {
	SSH_CONFIG_DIRECTORY="$HOME/.ssh"
	SSH_KEYS_NAME="id_$USERNAME"
	SSH_KEY_PATH="$SSH_CONFIG_DIRECTORY/$SSH_KEYS_NAME"
	SSH_KEYS_EXIST="$(find "$SSH_CONFIG_DIRECTORY" -type f -name "$SSH_KEYS_NAME" | wc -l)"

	if [ ! "$SSH_KEYS_EXIST" -gt 0 ]; then
		# Create the config directory if non-existent
		mkdir -p "$SSH_CONFIG_DIRECTORY"

		# Generate new keys
		ssh-keygen -t ed25519 -f "$SSH_KEY_PATH" -C "$USER_EMAIL"

		# Copy config template to config directory
		cp "../.ssh/config" "$SSH_CONFIG_DIRECTORY"

		# Update config with generated key path
		eval "$(sed -i '' "s/SSH_KEY_PATH/~\/.ssh\/$SSH_KEYS_NAME/" "$SSH_CONFIG_DIRECTORY/config")"

		# Start `ssh-agent` in the background
		eval "$(ssh-agent -s)"

		# Add private key to `ssh-agent`
		ssh-add --apple-use-keychain "$SSH_KEY_PATH"
	else
		echo "SSH keys already exist. Doing nothing"
	fi
}
