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
)

source "$ZSH/oh-my-zsh.sh"

# Homebrew-managed zsh plugins (installed via Brewfile)
BREW_PREFIX="$(brew --prefix)"
if [[ -n "$BREW_PREFIX" ]]; then
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source "$BREW_PREFIX/share/zsh-you-should-use/you-should-use.plugin.zsh"
fi

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================

# Local bin directory
export PATH="$PATH:$HOME/.local/bin"

# Preferred editor
export EDITOR='vim'

# ============================================================================
# HISTORY
# ============================================================================

setopt HIST_IGNORE_ALL_DUPS

# ============================================================================
# NVM (Node Version Manager)
# ============================================================================

export NVM_DIR="$HOME/.nvm"
[ -n "$BREW_PREFIX" ] && [ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"

# ============================================================================
# ALIASES (optional - add your custom aliases here)
# ============================================================================

# Example:
# alias ll='ls -la'
# alias gs='git status'
