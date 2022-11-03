> :warning: **Neovim 0.7 or higher is required.**

# Features

## Autopairs
- Opening bracket automatically generates closing bracket.
- Works for `""`, `''`, `[]`, `{}`, `()`, `\`\``
- Add custom rules [here](./lua/user/autopairs.lua)

https://user-images.githubusercontent.com/68642484/184055996-aaac6799-71a7-4c3c-a95a-c1e350a648eb.mp4

Credit to [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

## Code completion
- Neovim's native LSP is used for code completion.
- Indicators are shown for errors and warnings to the left of line numbers as provided by the LSP.
- Out of the box, supported languages include `python`, `bash`, `go`, `lua`, `yaml`, `html`, `json`, `markdown`
- To add more languages refer [here](#installing-additional-languages)

https://user-images.githubusercontent.com/68642484/184055953-d3f5ca03-2ddd-46b4-b3bc-9323b1df0cbc.mp4

Credit to [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

## Syntax highlighting
- This is done by [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) which is context aware.
- The theme [olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim) also supports `treesitter` integration
- It can also highlight hex colors #RRGGBB, thanks to [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)

![nvim-syntax-highlighting](https://user-images.githubusercontent.com/68642484/183983113-ae363855-e9c6-4c37-94cb-f810df6a4d26.png)

## Comments
- Commenting is handled by `treesitter`. Hence, it is context aware.
- Press <kbd>Space</kbd><kbd>c</kbd><kbd>Space</kbd> to comment a line.

https://user-images.githubusercontent.com/68642484/183983150-25f742a7-68c2-4a42-aa69-06b7cdaf8bac.mp4

Credit to [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

## Fuzzy finder
- FZF is used as a fuzzy finder.
- It is very good to search files quickly.
- If you have never used a fuzzy finder, try it. Highly recommended

https://user-images.githubusercontent.com/68642484/183983323-16d504f8-0b0d-4f35-b589-807eee169981.mp4

Credit to [vijaymarupudi/nvim-fzf](https://github.com/vijaymarupudi/nvim-fzf)

## Persistent undo
- With presistent-undo you can undo things you did in the previous session. Meaning, your undo history is saved between sessions.
- By default they are stored in `~/.local/share/nvim/undo`

## Gitsigns
- Indicators for added, changed and deleted lines is shown to the left of line numbers

![nvim-gitsigns](https://user-images.githubusercontent.com/68642484/183983385-84144213-41bb-4019-aeee-c23fe195a757.png)

Credit to [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

## Smooth scrolling
- Since neovim is a terminal application, pressing <kbd>Ctrl+D</kbd>, <kbd>Ctrl+U</kbd> and other vim movements can be unintuitive and can leave you lost.
- Hence, smooth scrolling lets you follow the cursor more easily.

https://user-images.githubusercontent.com/68642484/183983788-08bc0aa5-98fd-47fc-a0a7-e2ba07aefe60.mp4

Credit to [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)
