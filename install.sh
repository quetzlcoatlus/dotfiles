#!/bin/bash

# home directory dotfiles
file_paths="bash/.bash_profile bash/.bashrc git/.gitconfig vim/.vim/ vim/.vimrc tmux/.tmux.conf "
echo "Attempting home dotfile installation.."

for file in $file_paths
do
  ls -sv ~/dotfiles/"$file" ~/"$file"
done


# home/config directory dotfiles
config_file_paths="git/nvim/"
echo "Attempting .config dotfile installation.."

for file in $config_file_paths
do
  ls -sv ~/dotfiles/"$file" ~/.config/"$file"
done

