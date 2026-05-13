#!/bin/bash

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages and VS Code extensions from Brewfile
brew bundle --file="$(dirname "$0")/Brewfile"

# Install oh-my-zsh first (before symlinking .zshrc, so its default .zshrc gets overwritten)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Symlink dotfiles (ln -sf will overwrite oh-my-zsh's default .zshrc)
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# Link custom zsh theme into oh-my-zsh custom themes directory
mkdir -p ~/.oh-my-zsh/custom/themes
ln -sf ~/dotfiles/sorin-custom.zsh-theme ~/.oh-my-zsh/custom/themes/sorin-custom.zsh-theme

# Install Vim plugins (native packages — no plugin manager needed)
mkdir -p ~/.vim/pack/plugins/start
[ ! -d ~/.vim/pack/plugins/start/ctrlp.vim ] && \
  git clone https://github.com/ctrlpvim/ctrlp.vim ~/.vim/pack/plugins/start/ctrlp.vim
[ ! -d ~/.vim/pack/plugins/start/syntastic ] && \
  git clone https://github.com/vim-syntastic/syntastic ~/.vim/pack/plugins/start/syntastic
[ ! -d ~/.vim/pack/plugins/start/vim-markdown ] && \
  git clone https://github.com/preservim/vim-markdown ~/.vim/pack/plugins/start/vim-markdown

# Install latest LTS version of Node via nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"
nvm install --lts
nvm use --lts

source ~/.zshrc
