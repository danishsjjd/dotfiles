# Danish's dotfiles

Personal configuration managed with GNU Stow.

## Setup

### Clone

Clone the repository:

```sh
git clone https://github.com/danishsjjd/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Homebrew

Install [Homebrew](https://brew.sh) if needed:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the installer's instructions to add Homebrew to your `PATH`, then install the packages from the Brewfile:

```sh
brew bundle install -v
```

### Link configs

From the repository root, back up any existing configs, then create the symlinks in your home directory:

```sh
stow --target="$HOME" --no-folding bat fish ghostty git herdr mise vscode zsh
```

Add `--simulate --verbose` to preview the links before applying them. You can select only the Stow packages you want. `--no-folding` keeps directories such as `~/.config/fish` real so plugin installs do not write new files into this repository.

### Fish

Run the following **inside Fish** to add Homebrew to the path, load Fisher, and install everything in the linked `fish_plugins` file, including Fisher itself:

```fish
fish_add_path /opt/homebrew/bin /usr/local/bin
curl -fsSL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
```

### Oh My Zsh

If Oh My Zsh is not installed, install it before cloning custom plugins. `--keep-zshrc` preserves the `.zshrc` symlink created by Stow; `--unattended` skips changing the default shell and starting Zsh during setup:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
```

Clone the custom plugins if they are not already installed:

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
```

Open a new terminal session to load the configuration.

### Language runtimes

Install the runtimes declared in the mise config:

```sh
mise install
```

## Maintenance

Update the Brewfile after installing or removing Homebrew packages. Run this from the repository root and review the diff before committing:

```sh
brew bundle dump --force --casks --brew --tap
```

For Fish plugins, edit [fish_plugins](fish/.config/fish/fish_plugins), then apply the changes inside Fish:

```fish
fisher update
```

Fisher also updates this file when you use `fisher install` or `fisher remove`. Keep plugin names and version pins there.
