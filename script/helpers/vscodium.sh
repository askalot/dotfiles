#!/bin/sh

setup_vscodium() {
	VSCODIUM_CONFIG="../.vscode"

	while read -r line; do
		codium --install-extension "$line"
	done < "$VSCODIUM_CONFIG/extensions.txt"

	cp "$VSCODIUM_CONFIG/settings.json" ~/Library/Application\ Support/VSCodium/User
}
