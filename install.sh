#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config

ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/ghostty" ~/.config/ghostty
ln -sf "$DOTFILES_DIR/fish" ~/.config/fish

echo "Dotfiles installed successfully"
