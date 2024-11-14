setup_eza() {
	LINE_1='alias la="eza --all --group-directories-first --icons --long"'
	LINE_2='alias lt="eza --all --group-directories-first --icons --tree --git-ignore"'
	LINE_3='alias ll="eza --all --group-directories-first --icons --long --no-permissions --no-filesize --no-user --no-time --git"'

	for string in "$LINE_1" "$LINE_2" "$LINE_3"; do
			echo "$string" >> "$HOME/.zshrc"
	done
}
