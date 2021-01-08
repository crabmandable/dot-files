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
source_vim="source $PWD/.vimrc \" Make sure this stays on line 1"
if [ "$(head -n 1 ~/.vimrc)" == "$source_vim" ]; then
    echo "The .vimrc is already installed"
else
    confirm "Would you like to install the .vimrc?" && sed -i "1i $source_vim" ~/.vimrc
fi
confirm "Would you like to manually edit the .vimrc now?" && vim ~/.vimrc
confirm "Would you like to install/update vim plugins now?" && vim  +PluginClean! +PluginUpdate +PluginInstall +qall

echo "Finished"
