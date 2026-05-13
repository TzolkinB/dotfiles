#!/bin/bash

# what set -euo pipefail does:
# -e: Exit immediately if a command exits with a non-zero status.
# -u: Treat unset variables as an error and exit immediately.
# -o pipefail: If any command in a pipeline fails, the entire pipeline fails with that command's exit code.
set -euo pipefail

DOTFILES="$(dirname "$0")"

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure brew is on PATH for the rest of this script (no-op if already present)
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Install packages and VS Code extensions from Brewfile
# Note: vscode entries require the 'code' CLI to be on PATH.
# If VS Code isn't installed yet, brew bundle will fail on those entries.
# Install VS Code manually first, then re-run: brew bundle --file=$DOTFILES/Brewfile
if ! command -v code &> /dev/null; then
  echo "Warning: 'code' CLI not found — skipping VS Code extensions."
  echo "Install VS Code, add 'code' to PATH via the Command Palette, then re-run:"
  echo "  brew bundle --file=$DOTFILES/Brewfile"
  # Note: --file=/dev/stdin skips Brewfile.lock.json generation — intentional here since vscode entries are excluded
  grep -v '^vscode ' "$DOTFILES/Brewfile" | brew bundle --file=/dev/stdin
else
  brew bundle --file="$DOTFILES/Brewfile"
fi

# Install oh-my-zsh first (before symlinking .zshrc, so its default .zshrc gets overwritten)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Symlink dotfiles (ln -sf will overwrite oh-my-zsh's default .zshrc)
ln -sf "$DOTFILES/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/.vimrc" ~/.vimrc
ln -sf "$DOTFILES/.gitconfig" ~/.gitconfig

# Create ~/.gitconfig.local for personal identity if it doesn't exist (not tracked in this repo)
if [ ! -f "$HOME/.gitconfig.local" ]; then
  cat > "$HOME/.gitconfig.local" <<'EOF'
[user]
  name = Your Name
  email = your@email.com
EOF
  echo "Created ~/.gitconfig.local — update it with your name and email before committing."
fi

# Link custom zsh theme into oh-my-zsh custom themes directory
mkdir -p ~/.oh-my-zsh/custom/themes
ln -sf "$DOTFILES/sorin-custom.zsh-theme" ~/.oh-my-zsh/custom/themes/sorin-custom.zsh-theme

# Install Vim plugins (native packages — no plugin manager needed)
mkdir -p ~/.vim/pack/plugins/start
ln -sf "$DOTFILES/vim/ftplugin" ~/.vim/ftplugin
[ ! -d ~/.vim/pack/plugins/start/ctrlp.vim ] && \
  git clone https://github.com/ctrlpvim/ctrlp.vim ~/.vim/pack/plugins/start/ctrlp.vim
[ ! -d ~/.vim/pack/plugins/start/syntastic ] && \
  git clone https://github.com/vim-syntastic/syntastic ~/.vim/pack/plugins/start/syntastic
[ ! -d ~/.vim/pack/plugins/start/vim-markdown ] && \
  git clone https://github.com/preservim/vim-markdown ~/.vim/pack/plugins/start/vim-markdown

# Install latest LTS version of Node via nvm
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"
nvm install --lts
nvm use --lts

echo "Installation complete."
echo "Start a new terminal session or run 'exec zsh' to apply changes."