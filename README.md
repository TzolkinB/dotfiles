# dotfiles
- Use .oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
  - check zsh version `zsh --version`
  - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- set ZSH_THEME="sorin" (theme included with oh-my-zsh)
  - https://github.com/robbyrussell/oh-my-zsh/wiki/themes#sorin
- Add custom flatlands terminal color scheme (in terminal-schemes repo) to
    Terminal>Preferences and change shell command to `/bin/zsh`
- Install Homebrew (https://brew.sh/)
   - `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
  - use homebrew to install node
    - `brew install node`
      - check version with `node -v` and `npm -v`
- make sure the `bundle` folder is located in .vim/
- tmux

# Apps used
- Slack https://slack.com/downloads/osx
- Sublime Text https://www.sublimetext.com/
  - Add to Package Control:
    - Theme - Flatland
    - BracketHighlighter
    - Babel
    - HTMLBeautify
    - Emmet
- Moom (Window layout) https://manytricks.com/moom/
- Chrome 
- Firefox Dev Edition

## Other
- set up SSH for github
  - copy id_rsa & id_rsa.pub file into .ssh/ via Airdrop 
