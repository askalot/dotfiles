#!/bin/sh

setup_delta() {
	brew install delta

	git config --global core.pager "delta"
	git config --global interactive.diffFilter "delta --color-only --features=interactive"
	git config --global delta.line-numbers "true"
	git config --global delta.navigate "true"
}
