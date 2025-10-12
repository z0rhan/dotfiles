#bin/bash

DOTFILES="$HOME/dev/dotfiles"

ln -sf $DOTFILES/nvim ~/.config/nvim
ln -sf $DOTFILES/fastfetch ~/.config/fastfetch
ln -sf $DOTFILES/rofi ~/.config/rofi
ln -sf $DOTFILES/kitty ~/.config/kitty
ln -sf $DOTFILES/wezterm ~/.config/wezterm
ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/.vimrc ~/.vimrc
ln -sf $DOTFILES/.zshrc ~/.zshrc
ln -sf $DOTFILES/.vim ~/.vim

echo "Link successfull"
