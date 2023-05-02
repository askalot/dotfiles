#!/bin/sh

setup_homebrew() {
	if ! brew; then
		# Install Homebrew
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

		# Configure Homebrew
		(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/ahsoka/.zprofile
		eval "$(/opt/homebrew/bin/brew shellenv)"

		# Opt out off analytics
		# Reference: https://docs.brew.sh/Analytics
		brew analytics off
	fi

	# Install packages
	brew bundle install --file "../Brewfile"
}
