#bin/bash

DOTFILES="$HOME/Dev/dotfiles/scripts"

ln -sf $DOTFILES/nvim ~/.config/nvim
ln -sf $DOTFILES/fastfetch ~/.config/fastfetch
ln -sf $DOTFILES/rofi ~/.config/rofi
ln -sf $DOTFILES/kitty ~/.config/kitty
ln -sf $DOTFILES/wezterm ~/.config/wezterm
ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/.vimrc ~/.vimrc
ln -sf $DOTFILES/.zshrc ~/.zshrc

echo "Link successfull"
