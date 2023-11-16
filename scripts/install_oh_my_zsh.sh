#!/bin/bash

set -e

ensure_oh_my_zsh_installed() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh is not installed. Installing..."
        if sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
            echo "Oh My Zsh installation successful."
        else
            echo "Error: Oh My Zsh installation failed."
            exit 1
        fi
    fi
}

ensure_oh_my_zsh_installed
