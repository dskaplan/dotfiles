#!/bin/sh

cd ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s dotfiles/.bash_profile   .bash_profile
ln -s dotfiles/git/.gitconfig  .gitconfig
ln -s dotfiles/.tmux.conf      .tmux.conf
ln -s dotfiles/.vimrc          .vimrc
ln -s dotfiles/.aliases        .aliases 
ln -s dotfiles/.functions      .functions
vim pluginInstall +qall

if [ "$(uname)" = Darwin ]; then
  sh dotfiles/tweaks.sh
fi



