> :warning: **Neovim 0.7 or higher is required.**

# Features

Get a list of highlight features [here](./features.md)

# Installation

## Installing dependencies

Make sure you have the following packages installed:
git, wget, curl, gcc, cmake, fd, ripgrep, fzf, neovim, nodejs, npm, unzip, go

```bash
# For Arch Linux
sudo pacman -Sy git wget curl gcc cmake fd ripgrep fzf neovim nodejs npm unzip go clang llvm

# For Fedora
sudo dnf install git wget curl gcc cmake fd-find ripgrep fzf neovim nodejs npm golang clang-devel llvm-devel

# For Debian/Ubuntu
sudo apt install git wget curl gcc cmake fd-find ripgrep fzf neovim nodejs npm golang-go clang llvm
```

## Setup

- Clone this repo to `~/.config/nvim/`
```bash
git clone https://github.com/sujay1844/neovim-config.git ~/.config/nvim/
```
- Run `nvim` for the first time to install plugins.
- Exit and run `nvim` again to install Treesitter parsers and LSP servers.
To see progress of installation of LSP servers, run `:LspInstallInfo`

## Installing additional languages

1. Add your language to `treesitter` in this [file](./lua/user/treesitter.lua) in the `parsers` array. The appropriate name required can be found [here](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)  and then run `:TSInstall` or restart `nvim`
2. Add your language to `LSP` in this [file](./lua/user/lspconfig.lua) in the `servers` array. The appropriate name can be found [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) or run `:LspInstallInfo` or restart `nvim`
