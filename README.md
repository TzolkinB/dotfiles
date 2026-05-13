# SetUp

## Prerequisites

**1. Xcode Command Line Tools** — required by Homebrew and git:

```bash
xcode-select --install
```

A dialog will appear prompting you to install. This must complete before running the quickstart steps below.

**2. Rosetta 2** (Apple Silicon only) — required for some x86-only binaries:

```bash
softwareupdate --install-rosetta --agree-to-license
```

**3. SSH key** — needed to clone private repos. See SSH setup docs.

## New Machine Quickstart

1. Install [Homebrew](https://brew.sh/)
2. Clone this repo: `git clone <repo-url> ~/dotfiles`
3. Make the install script executable: `chmod +x ~/dotfiles/install.sh`
4. Run the install script: `cd ~/dotfiles && ./install.sh`
   - Installs oh-my-zsh, then symlinks dotfiles (order matters — prevents oh-my-zsh from overwriting `.zshrc`)
   - Installs all Homebrew packages and VS Code extensions from `Brewfile`
   - Symlinks `.zshrc`, `.vimrc`, and `.gitconfig`
   - Symlinks `sorin-custom.zsh-theme` into `~/.oh-my-zsh/custom/themes/`
   - Installs latest LTS Node via nvm
5. Update `.gitconfig` with your name and email — see [Git Config](#git-config) below.

## Brewfile

`Brewfile` is a declarative list of all Homebrew formulae and VS Code extensions. It's used automatically by `install.sh` — you don't need to run it manually during setup.

To update it after installing new packages on your machine:

```bash
brew bundle dump --file=~/dotfiles/Brewfile --force
```

---

## Shell Theme (sorin-custom)

`sorin-custom.zsh-theme` is a modified version of oh-my-zsh's built-in `sorin` theme. It lives in this repo and is version-controlled alongside your other dotfiles.

`install.sh` symlinks it into `~/.oh-my-zsh/custom/themes/`, which is where oh-my-zsh looks for custom themes. The symlink means any edits to the file in this repo are reflected immediately — no copying needed.

`.zshrc` activates it with `ZSH_THEME="sorin-custom"`.

---

## Terminal Color Scheme

Import `SublimeFlatland 1.terminal` to Terminal > Settings > Profiles.

---

## Vim

`.vimrc` is symlinked to `~/.vimrc` by `install.sh`. Plugins are managed using Vim's built-in package system (Vim 8+) — no plugin manager needed.

`install.sh` clones plugins into `~/.vim/pack/plugins/start/`, which Vim loads automatically on startup:

| Plugin                                                    | Purpose                      |
| --------------------------------------------------------- | ---------------------------- |
| [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)        | Fuzzy file finder (`Ctrl+P`) |
| [syntastic](https://github.com/vim-syntastic/syntastic)   | Linting and syntax checking  |
| [vim-markdown](https://github.com/preservim/vim-markdown) | Markdown support             |

To add a new plugin: `git clone <plugin-url> ~/.vim/pack/plugins/start/<plugin-name>`, then add the same line to `install.sh`.

---

## Apps & Tools

Moom and Firefox Developer Edition are installed automatically via `Brewfile`. The following require manual setup:

> **Note:** The `Brewfile` installs the direct-download version of Moom (`cask "moom"`). If you purchased Moom from the Mac App Store, the MAS license won't carry over — you'd need to buy it again from the developer's site. In that case, remove `cask "moom"` from the Brewfile and install it manually from the MAS.

- **[VS Code](https://code.visualstudio.com/)** — download and install manually
  - Extensions are installed automatically via `Brewfile`
  - **Launch from command line** — after installing, open the Command Palette (`Cmd+Shift+P`), type `shell command`, and select `Shell Command: Install 'code' command in PATH`. Restart the terminal, then `code .` will work.
- **Slack / Discord** — download manually

---

## Chrome Extensions

- OneTab
- Eye Dropper
- Awesome Screen Recorder & Screenshot

---

## Git Config

`.gitconfig` is symlinked to `~/.gitconfig` by `install.sh`.

> **Action required:** The file contains placeholder values. Update them before making any commits:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## Maintenance

Run periodically to keep packages up to date:

```bash
brew update && brew upgrade && brew cleanup
```

After installing any new Homebrew packages or VS Code extensions, sync the Brewfile:

```bash
brew bundle dump --file=~/dotfiles/Brewfile --force
```

To upgrade to a new Node LTS version:

```bash
nvm install --lts
nvm alias default lts/*
```

To check for Homebrew issues:

```bash
brew doctor
```
