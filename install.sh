#!/bin/bash

DOTFILES_DIR=$(pwd)
# echo $DOTFILES_DIR

# Associative array of dotfiles and destinations
# file_paths="bash/.bash_profile bash/.bashrc git/.gitconfig vim/.vim/ vim/.vimrc tmux/.tmux.conf "
# echo "Attempting home dotfile installation.."
declare -A FILE_MAP=(
  ["bash/.bash_profile"]="$HOME/.bash_profile"
  ["bash/.bashrc"]="$HOME/.bashrc"
  ["git/.gitconfig"]="$HOME/.gitconfig"
  ["tmux/.tmux.conf"]="$HOME/.tmux.conf"
  ["vim/.vimrc"]="$HOME/.vimrc"
  ["vim/.vim"]="$HOME/.vim"
  ["vim/nvim"]="$HOME/.config/nvim"
  ["ssh/config"]="$HOME/.ssh/config"
)


link_file() {
  src="$DOTFILES_DIR/$1"
  dest="$2"

  # Create parent directory if it doesn't exist
  mkdir -p "$(dirname "$dest")"

  # Backup existing file if it exists
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up existing file: $dest"
    mv "$dest" "$dest.backup"
  fi

  # Delete symlink if it exists
  if [ -L "$dest" ]; then
    echo "Deleting symlink: $dest"
    rm "$dest"
  fi

  # Create symlink
  ln -s "$src" "$dest"
  echo "Linked: $src -> $dest"
}


# Loops through file map and creates link for each file
for key in "${!FILE_MAP[@]}"; do
  link_file "$key" "${FILE_MAP[$key]}"
done


# for file in $file_paths
# do
#   ls -sv ~/dotfiles/"$file" ~/"$file"
# done


# home/config directory dotfiles
# config_file_paths="git/nvim/"
# echo "Attempting .config dotfile installation.."

# for file in $config_file_paths
# do
#   ls -sv ~/dotfiles/"$file" ~/.config/"$file"
# done

