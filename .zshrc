# ============================================================================
# OH-MY-ZSH SETUP
# ============================================================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sorin-custom"

# Disable automatic oh-my-zsh updates (you'll update manually or via Homebrew)
zstyle ':omz:update' mode disabled

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Show animated dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Add timestamps to shell history (useful for debugging)
HIST_STAMPS="yyyy-mm-dd"

# Plugins to load
plugins=(
  git
  dotenv
  nvm
)

source $ZSH/oh-my-zsh.sh

# Homebrew-managed zsh plugins (installed via Brewfile)
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh"

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================

# Python 3.13
export PATH="$PATH:$HOME/Library/Python/3.13/bin"

# Local bin directory
export PATH="$PATH:$HOME/.local/bin"

# Preferred editor
export EDITOR='vim'

# ============================================================================
# HISTORY
# ============================================================================

HISTCONTROL=ignoredups:erasedups

# ============================================================================
# NVM (Node Version Manager)
# ============================================================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ============================================================================
# ALIASES (optional - add your custom aliases here)
# ============================================================================

# Example:
# alias ll='ls -la'
# alias gs='git status'
