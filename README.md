# Danish's dotfiles

## Setup

Clone the repository:

```sh
git clone https://github.com/danishsjjd/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install [Homebrew](https://brew.sh) and Stow:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install stow
```

Back up any existing configs, then create the symlinks:

```sh
stow --no-folding bat fish ghostty git herdr mise vscode zsh
```

### Oh My Zsh

Use `--keep-zshrc` so the installer preserves the `.zshrc` symlink created by Stow:

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
```
