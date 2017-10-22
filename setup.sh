#!/bin/bash

unamestr=`uname`
if [[ "$unamestr" != "Darwin" ]]; then
    echo "Anything other than OSX hasn't been touched, yet. Aborting."
    exit 0
fi

command_exists() {
    if command -v $1 2>/dev/null; then
       return 1
    else
       return 0
    fi
}
echo `command_exists git`
if command_exists git; then
    echo "git exists yay!"
fi

echo "Starting basic setup."

git clone https://github.com/abertsch/Menlo-for-Powerline.git
if [[ "$unamestr" != "Darwin" ]]; then
    cp Menlo-for-Powerline/* ~/Library/Fonts
else
    cp Menlo-for-Powerline/* ~/.local/share/fonts
fi

git clone https://github.com/powerline/fonts.git
fonts/install.sh
rm -rf fonts

git submodule update --init --recursive
cp .vimrc ~
cp .gvimrc ~
cp -r .vim ~/
