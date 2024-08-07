# I install ohmyzsh though I don't really make use of the plugins so could probably do without in the future since I also customize the sorin theme

# .zshrc has code installed by oh-my-zsh and nvm
# ------------- #
# .oh-my-zsh/custom/themes/sorin-custom.zsh-theme

MODE_INDICATOR="%B%F{red}❮%{$reset_color%}%F{red}❮❮%{$reset_color%}"
local return_status="%F{red}%(?..⏎)%{$reset_color%}"
   
# %@ is current time of day in 12 hr am/pm format
# %c is deprecated, equivalent to %1~ and %1/
#PROMPT='%@ %{$fg[cyan]%}%c$(git_prompt_info) %(!.%{$fg_bold[red]%}#.%{$fg_bold[green]    %}$)%{$reset_color%} '
PROMPT='%@ %F{cyan}%1~$(git_prompt_info) %(!.%B%F{red}#.%B%F{green}$)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=":%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%F{green} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan} ✭"
