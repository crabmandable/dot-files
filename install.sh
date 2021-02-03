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
        if [ -f ~/.vimrc ] && confirm "A .vimrc already exists here, would you like to move it to '.vimrc-extra'? (saying no deletes it)"; then
            confirm "Would you like to manually edit the old vimrc first?" && vim ~/.vimrc
            mv ~/.vimrc ~/.vimrc-extra
        else
            rm -f ~/.vimrc
        fi

        ln -s $PWD/vim/.vimrc ~/.vimrc
    fi

    nviminit=~/.config/nvim/init.vim
    if [ -f $nviminit ] && [ -L $nviminit ] && [ $(readlink $nviminit) -ef $PWD/nvim/init.vim ]; then
        echo "The nvim/init.vim is already installed"
    else
        rm -f $nviminit
        mkdir -p ~/.config/nvim
        ln -s $PWD/nvim/init.vim $nviminit
    fi

    if [ ! -f ~/.vim/autoload/plug.vim ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    if confirm "Would you like to install/update vim plugins now?"; then 
        if which nvim 2>&1 >/dev/null; then
            nvim +PlugClean! +PlugUpdate +PlugInstall +qall
        else
            vim  +PlugClean! +PlugUpdate +PlugInstall +qall
        fi
    fi

    if ! which rg 2>&1 >/dev/null; then
        echo Don\'t forget to install ripgrep too for faster searching
    fi
    if ! which bat 2>&1 >/dev/null; then
        echo Don\'t forget to install bat too for previews with highlighting
    fi
fi

echo "Finished"
