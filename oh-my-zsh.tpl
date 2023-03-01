#!/bin/bash

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  sudo apt update
  sudo apt install git
fi

sudo apt install zsh -y

yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt-get update &&
sudo apt-get install -y python3-pip &&
sudo apt-get install -y autojump &&

sudo chmod -R 755 $ZSH_CUSTOM

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(git)/plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)/g; s/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

chsh -s $(which zsh)

exec zsh
