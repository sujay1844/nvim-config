> :warning: **Neovim 0.7 or higher is required.**

# Features

## Autopairs
- Opening bracket automatically generates closing bracket.
- Works for `""`, `''`, `[]`, `{}`, `()`, `\`\``
- Add custom rules [here](./lua/user/autopairs.lua)

<- GIF here ->

Credit to [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

## Code completion
- Neovim's native LSP is used for code completion.
- Indicators are shown for errors and warnings to the left of line numbers as provided by the LSP.
- Out of the box, supported languages include `python`, `bash`, `go`, `lua`, `yaml`, `html`, `json`, `markdown`
- To add more languages refer [here](#installing-additional-languages)

<- GIF here ->

Credit to [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

## Syntax highlighting
- This is done by [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) which is context aware.
- The theme [olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim) also supports `treesitter` integration
- It can also highlight hex colors #RRGGBB, thanks to [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)

<- Screenshot here ->

## Comments
- Commenting is handled by `treesitter`. Hence, it is context aware.
- Press <kbd>Space</kbd><kbd>c</kbd><kbd>Space</kbd> to comment a line.

<- GIF here ->

Credit to [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

## Fuzzy finder
- FZF is used as a fuzzy finder.
- It is very good to search files quickly.
- If you have never used a fuzzy finder, try it. Highly recommended

<- GIF here ->

Credit to [vijaymarupudi/nvim-fzf](https://github.com/vijaymarupudi/nvim-fzf)

## Persistent undo
- With presistent-undo you can undo things you did in the previous session. Meaning, your undo history is saved between sessions.
- By default they are stored in `~/.local/share/nvim/undo`

## Gitsigns
- Indicators for added, changed and deleted lines is shown to the left of line numbers

<- Screenshot here ->

Credit to [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

## Smooth scrolling
- Since neovim is a terminal application, pressing <kbd>Ctrl+D</kbd>, <kbd>Ctrl+U</kbd> and other vim movements can be unintuitive and can leave you lost.
- Hence, smooth scrolling lets you follow the cursor more easily.

<- GIF here ->

Credit to [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)

# Installation

## Installing dependencies

Make sure you have the following packages installed:
git, wget, curl, gcc, cmake, fd, ripgrep, fzf, neovim, nodejs, npm, unzip, go

```bash
# For Arch Linux
sudo pacman -Sy git wget curl gcc cmake fd ripgrep fzf neovim nodejs npm unzip go

# For Fedora
sudo dnf install git wget curl gcc cmake fd-find ripgrep fzf neovim nodejs npm golang

# For Debian/Ubuntu
sudo apt install git wget curl gcc cmake fd-find ripgrep fzf neovim nodejs npm golang-go
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
