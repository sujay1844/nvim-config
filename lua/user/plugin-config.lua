local vim = vim
-- Colorscheme
vim.cmd("set termguicolors")
local status_ok, onedarkpro = pcall(require, "onedarkpro")
if status_ok then onedarkpro.load() end

local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if status_ok then nvim_lsp_installer.setup() end

local status_ok, lualine = pcall(require, "lualine")
if status_ok then lualine.setup() end

require("user.snippets")
require("user.treesitter")
require("user.cmp")
require("user.lsp").setup()
require("user.lspconfig")
require("user.gitsigns")
require("user.comment")
require("user.autopairs")
require("user.scroll")

-- Display hex colors
local status_ok, colorizer = pcall(require, "colorizer")
if status_ok then colorizer.setup() end
