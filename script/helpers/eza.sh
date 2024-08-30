setup_eza() {
	LINE_1='alias la="eza --all --group-directories-first --icons --long"'
	LINE_2='alias lt="eza --all --group-directories-first --icons --tree --git-ignore"'

	for string in "$LINE_1" "$LINE_2"; do
			echo "$string" >> "$HOME/.zshrc"
	done
}
