#!/bin/bash

function install_zsh() {
    if ! grep -q ".envrc-wrapper" $HOME/.zshrc; then
        echo 'source $HOME/.envrc-wrapper/envrc' >> $HOME/.zshrc
        echo "envrc source action has been installed to ~/.zshrc"
    fi
}

function install_bash() {
    if ! grep -q ".envrc-wrapper" $HOME/.bashrc; then
        echo 'source $HOME/.envrc-wrapper/envrc' >> $HOME/.bashrc
        echo "envrc source action has been installed to ~/.bashrc"
    fi
}

mkdir -p $HOME/.envrc-wrapper
install -m 755 ./bin/envrc $HOME/.envrc-wrapper

if [ "$SHELL" == "/bin/zsh" ]; then
    install_zsh
elif [ "$SHELL" == "/bin/bash" ]; then
    install_bash
fi
