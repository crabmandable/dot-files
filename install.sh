#!/bin/bash

cd $(dirname $0)

confirm() {
	# call with a prompt string or use a default
	read -r -p "${1:-Are you sure?} [Y/n] " response
	case "$response" in
	[nN][oO] | [nN])
		false
		;;
	*)
		true
		;;
	esac
}

has_nvim() {
	command -v nvim >/dev/null
}

# VIM
if confirm "Would you like to install the .vimrc?"; then
	# if its already installed do nothing
	if [ -f ~/.vimrc ] && [ -L ~/.vimrc ] && [ $(readlink ~/.vimrc) -ef $PWD/vim/.vimrc ]; then
		echo "The .vimrc is already installed"
	else
		# if theres already a vimrc, check about moving it to .vimrc-extra
		if [ -f ~/.vimrc ] && confirm "A .vimrc already exists here, would you like to move it to '.vimrc-extra'? (saying no deletes it)"; then
			confirm "Would you like to manually edit the old vimrc first?" && vim ~/.vimrc
			mv ~/.vimrc ~/.vimrc-extra
		else
			rm -f ~/.vimrc
		fi

		ln -s $PWD/vim/.vimrc ~/.vimrc
	fi

	if [ ! -f ~/.vim/autoload/plug.vim ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi

	if confirm "Would you like to install/update vim plugins now?"; then
		vim +PlugClean! +PlugUpdate +PlugInstall +qall
	fi
fi

if confirm "Would you like to install the nvim config?"; then
	nviminit=~/.config/nvim
	if [ -d $nviminit ] && [ -L $nviminit ] && [ $(readlink $nviminit) -ef $PWD/nvim/ ]; then
		echo "The nvim config is already installed"
	elif [ -d $nviminit ]; then
		echo moving $nviminit to $nviminit.bak
		mv $nviminit{,.bak}
	fi
	ln -s $PWD/nvim $nviminit
fi

if command -v kitty >/dev/null; then
	if confirm "Would you like to install the kitty config?"; then
		if [ -f ~/.config/kitty/kitty.conf ]; then
			if confirm "kitty.conf already exists. Would you like to replace it?"; then
				rm ~/.config/kitty/kitty.conf
				ln -s $PWD/kitty/kitty.conf ~/.config/kitty/kitty.conf
			fi
		else
			ln -s $PWD/kitty/kitty.conf ~/.config/kitty/kitty.conf
		fi

		if [ -f ~/.config/kitty/colors.conf ]; then
			if confirm "kitty colors.conf already exists. Would you like to replace it?"; then
				rm ~/.config/kitty/colors.conf
				ln -s $PWD/kitty/colors.conf ~/.config/kitty/colors.conf
			fi
		else
			ln -s $PWD/kitty/colors.conf ~/.config/kitty/colors.conf
		fi
	fi
fi

echo "Finished"
