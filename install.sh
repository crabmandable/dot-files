#!/bin/bash

cd $(dirname $0)

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure?} [Y/n] " response
    case "$response" in
        [nN][oO]|[nN]) 
            false
            ;;
        *)
            true
            ;;
    esac
}

# VIM
if confirm "Would you like to install the .vimrc?"; then
    # if its already installed do nothing
    if [ -f ~/.vimrc ] && [ -L ~/.vimrc ] && [ $(readlink ~/.vimrc) -ef $PWD/vim/.vimrc ]; then
        echo "The .vimrc is already installed"
    else
        # if theres already a vimrc, check about moving it to .vimrc-extra
        if confirm "A .vimrc already exists here, would you like to move it to '.vimrc-extra'? (saying no deletes it)"; then
            confirm "Would you like to manually edit the old vimrc first?" && vim ~/.vimrc
            mv ~/.vimrc ~/.vimrc-extra
        else
            rm ~/.vimrc
        fi

        ln -s $PWD/vim/.vimrc ~/.vimrc
    fi
    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    confirm "Would you like to install/update vim plugins now?" && vim  +PluginClean! +PluginUpdate +PluginInstall +qall
fi

echo "Finished"
