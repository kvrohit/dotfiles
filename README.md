# dotfiles

Configurations for various programs

## How to use

1. Clone this repo.
2. Create a symlink in your `~/.config` folder.

## App installations

### macOS

1. Install Homebrew from https://brew.sh/
2. Install various apps using `brew install <application>`

### Arch Linux

Install apps using `pacman -S <application>` or from AUR (`yay`)

## App setup

### neovim

1. Install neovim `0.5` nightly using any of the package managers that works with your OS.
2. Install packer `git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`.
3. Launch `neovim` then `:PackerCompile`, restart and `:PackerSync` to install all plugins.
