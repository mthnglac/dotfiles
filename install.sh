#!/bin/bash

set -e

install_homebrew_and_packages() {
    install_homebrew() {
        if ! command -v brew &> /dev/null; then
            echo "Homebrew is not installed. Installing..."
            if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
                echo "Homebrew installation successful."
            else
                echo "Error: Homebrew installation failed."
                exit 1
            fi
        fi
    }

    install_homebrew_packages() {
        echo "Installing Homebrew packages..."
        if brew bundle --file="$DOTFILES_DIR/Brewfile"; then
            echo "Homebrew packages installation complete."
        else
            echo "Error: Homebrew packages installation failed."
            exit 1
        fi
    }
}

install_zsh_config() {
    DOTFILES_DIR="$HOME/Code/development/dotfiles"
    ZSH_CONFIG_DIR="$DOTFILES_DIR/zsh"

    ensure_zsh_installed() {
        echo "Checking if Zsh is installed..."

        if brew list | grep -q '^zsh$'; then
            echo "Zsh is already installed."
        else
            echo "Zsh is not installed. Installing..."
            if brew install zsh; then
                echo "zsh installation successful."
            else
                echo "Error: Zsh installation failed."
                exit 1
            fi
        fi
    }

    change_default_shell_as_zsh() {
        if [[ "$SHELL" != "/bin/zsh" ]]; then
            echo "Setting Zsh as the default shell..."
            if chsh -s /bin/zsh; then
                echo "zsh installation successful."
            else
                echo "Error: Setting Zsh as the default shell failed."
                exit 1
            fi
        fi
    }

    ensure_zsh_config_installed() {
        # ~/.zshrc sembolik bağı var mı kontrol et
        if [ -L "$HOME/.zshrc" ] || [ -e "$HOME/.zshrc" ]; then
            echo ".zshrc symbolic link is already created. Skipping..."
        else
            echo "Creating symbolic link for .zshrc..."
            if ln -s "$ZSH_CONFIG_DIR/.zshrc" "$HOME/.zshrc"; then
                echo ".zshrc symbolic link created."
            else
                echo "Error: Creating symbolic link failed."
                exit 1
            fi
        fi
    }

    ensure_zsh_installed
    change_default_shell_as_zsh
    ensure_zsh_config_installed

    echo "Zsh configuration installation complete."
}

install_fonts() {
    echo "Installing fonts..."

    FONT_DIR="$DOTFILES_DIR/fonts"
    TARGET_DIR="$HOME/.local/share/fonts/"

    # ~/.local/share/ dizininde fonts klasörü yoksa oluştur
    if [ ! -d "$HOME/.local/share/fonts" ]; then
        echo "Creating directory: $HOME/.local/share/fonts"
        mkdir -p "$HOME/.local/share/fonts"
    fi

    # Her bir font dosyasını kontrol et ve kopyala
    for font_file in "$FONT_DIR"/*; do
        font_name=$(basename "$font_file")
        target_path="$TARGET_DIR$font_name"

        if [ -e "$target_path" ]; then
            echo "Font '$font_name' is already installed. Skipping..."
        else
            cp "$font_file" "$TARGET_DIR"
            echo "Font '$font_name' installed."
        fi
    done

    # Font cache'ini güncelle
    # only show errors
    fc-cache -f -v > /dev/null

    echo "Font installation complete."
}

install_mpv_config() {
    DOTFILES_DIR="$HOME/Code/development/dotfiles"
    MPV_CONFIG_DIR="$DOTFILES_DIR/mpv"
    TARGET_DIR="$HOME/.config/"

    ensure_mpv_installed() {
        # Brewfile içinde mpv var mı kontrol et
        if brew list | grep -q '^mpv$'; then
            echo "mpv is already installed."
        else
            echo "Installing mpv..."
            if brew install mpv; then
                echo "mpv installation successful."
            else
                echo "Error: mpv installation failed."
                exit 1
            fi
        fi
    }

    ensure_mpv_config_installed() {
        # ~/.config/mpv dizini ya da sembolik linki var mı kontrol et
        if [ -L "$TARGET_DIR/mpv" ] || [ -e "$TARGET_DIR/mpv" ]; then
            echo "mpv configuration link is already installed. Skipping..."
        else
            # mpv dizinini ~/.config/ altına sembolik bağ olarak ekle
            ln -s "$MPV_CONFIG_DIR" "$TARGET_DIR/mpv"
            echo "mpv configuration installed."
        fi

        echo "mpv configuration installation complete."
    }

    ensure_mpv_installed
    ensure_mpv_config_installed
}

# install_tmux_config() {
#     ensure_tmux_installed() {
#         # Brewfile içinde tmux var mı kontrol et
#         if brew list | grep -q '^tmux$'; then
#             echo "tmux is already installed."
#         else
#             echo "Installing tmux..."
#             if brew install tmux; then
#                 echo "tmux installation successful."
#             else
#                 echo "Error: tmux installation failed."
#                 exit 1
#             fi
#         fi
#     }
#
#     ensure_oh_my_tmux_installed() {
#         OH_MY_TMUX_DIR="$HOME/.tmux"
#
#         # oh-my-tmux dizini var mı kontrol et
#         if [ -d "$OH_MY_TMUX_DIR" ]; then
#             echo "oh-my-tmux is already installed."
#         else
#             echo "Installing oh-my-tmux..."
#             git clone https://github.com/gpakosz/.tmux.git "$OH_MY_TMUX_DIR"
#             ln -s -f "$OH_MY_TMUX_DIR/.tmux.conf" "$HOME/.tmux.conf"
#             cp "$OH_MY_TMUX_DIR/.tmux.conf.local" "$HOME/"
#             echo "oh-my-tmux installation successful."
#         fi
#     }
#
#     ensure_tmux_config_installed() {
#         TMUX_CONFIG_FILE="$DOTFILES_DIR/tmux/.tmux.conf.local"
#         TARGET_FILE="$HOME/.tmux.conf.local"
#
#         # ~/.tmux.conf.local dosyası ya da sembolik linki var mı kontrol et
#         if [ -L "$TARGET_FILE" ] || [ -e "$TARGET_FILE" ]; then
#             echo "tmux configuration link is already installed. Skipping..."
#         else
#             # tmux konfigürasyon dosyasını ~/.tmux.conf.local altına sembolik bağ olarak ekle
#             ln -s "$TMUX_CONFIG_FILE" "$TARGET_FILE"
#             echo "tmux configuration installed."
#         fi
#
#         echo "tmux configuration installation complete."
#     }
#
#     ensure_tmux_installed
#     ensure_oh_my_tmux_installed
#     ensure_tmux_config_installed
#
#     echo "tmux configuration installation complete."
# }

install_nvim_config() {
    ensure_nvim_installed() {
        if brew list | grep -q '^neovim$'; then
            echo "neovim is already installed."
        else
            echo "Installing neovim..."
            if brew install neovim --HEAD; then
                echo "neovim installation successful."
            else
                echo "Error: neovim installation failed."
                exit 1
            fi
        fi
    }

    ensure_nvim_config_installed() {
        NVIM_CONFIG_DIR="$DOTFILES_DIR/nvim"
        TARGET_DIR="$HOME/.config/nvim"

        # ~/.config/nvim dizini ya da sembolik linki var mı kontrol et
        if [ -L "$TARGET_DIR" ] || [ -e "$TARGET_DIR" ]; then
            echo "neovim configuration link is already installed. Skipping..."
        else
            # neovim konfigürasyon dosyasını ~/.config/nvim altına sembolik bağ olarak ekle
            ln -s "$NVIM_CONFIG_DIR" "$TARGET_DIR"
            echo "neovim configuration installed."
        fi
    }

    ensure_nvim_installed
    ensure_nvim_config_installed

    echo "neovim configuration installation complete."
}

main() {
    DOTFILES_DIR="$HOME/Code/development/dotfiles"

    install_homebrew_and_packages
    install_zsh_config
    install_fonts
    install_mpv_config
    # install_tmux_config
    install_nvim_config

    echo "Dotfiles installation complete."
}

main
