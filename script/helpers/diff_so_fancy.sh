#!/bin/sh

setup_diff_so_fancy() {
	git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
	git config --global interactive.diffFilter "diff-so-fancy --patch"
}
