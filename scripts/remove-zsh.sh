#!/bin/bash

# Oh My Zsh'i kaldır
echo "Oh My Zsh kaldırılıyor..."
rm -rf ~/.oh-my-zsh

# Zsh'i kaldır
echo "Zsh kaldırılıyor..."
brew uninstall zsh

# Zsh ile ilişkili dosyaları temizle
echo "Zsh ile ilişkili dosyalar temizleniyor..."
rm -rf ~/.zsh* ~/.zcompdump

# Homebrew paketlerini temizle
echo "Homebrew paketleri temizleniyor..."
brew cleanup

echo "Kaldırma işlemi tamamlandı."
