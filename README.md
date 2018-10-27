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

# Apps to Download
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

# Tools to Bookmark
- Evernote https://evernote.com/
- Passpack 8 https://app.passpack.com/#/login

# Chrome Extensions
- Eye Dropper http://eye-dropper.kepi.cz/
- Awesome Screenshot https://chrome.google.com/webstore/detail/awesome-screenshot-screen/nlipoenfbbikpbjkfpfillcgkoblgpmj
- Web Developer (Information tab has useful Accessibility options) https://chrispederick.com/work/web-developer/
- Stylus (to change the color of visited links in Google search results) https://add0n.com/stylus.html
![Screenshot of Style](https://github.com/TzolkinB/dotfiles/blob/master/preview.png)

## Other
- set up SSH for github
  - copy id_rsa & id_rsa.pub file into .ssh/ via Airdrop 
