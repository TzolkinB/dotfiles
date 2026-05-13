# sorin-custom.zsh-theme
# A modified version of the sorin theme from oh-my-zsh.
# Symlinked to ~/.oh-my-zsh/custom/themes/sorin-custom.zsh-theme by install.sh

MODE_INDICATOR="%B%F{red}❮%{$reset_color%}%F{red}❮❮%{$reset_color%}"
return_status="%F{red}%(?..⏎)%{$reset_color%}"

# Prompt: time, current directory, git info, and prompt symbol
PROMPT='%@ %F{cyan}%1~$(git_prompt_info) %(!.%B%F{red}#.%B%F{green}$)%{$reset_color%} '

# Right-aligned: return status and git status
RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}'

# Git prompt styling
ZSH_THEME_GIT_PROMPT_PREFIX=":%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Git status indicators
ZSH_THEME_GIT_PROMPT_ADDED="%F{green} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan} ✭"
