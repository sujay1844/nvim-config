local plugins = function ()
	-- Colorscheme
	vim.cmd("set termguicolors")
	local status_ok, onedarkpro = pcall(require, "onedarkpro")
	if status_ok then onedarkpro.load() end

	local status_ok, nvim_lsp_installer = pcall(require, "mason")
	if status_ok then nvim_lsp_installer.setup() end

	local status_ok, lualine = pcall(require, "lualine")
	if status_ok then lualine.setup() end

	require("user.snippets")
	require("user.treesitter")
	require("user.cmp")
	require("user.lsp").setup()
	require("user.gitsigns")
	require("user.comment")
	require("user.autopairs")
	require("user.scroll")
	require("user.telescope")
	require("user.toggleterm")

	-- Display hex colors
	local status_ok, colorizer = pcall(require, "colorizer")
	if status_ok then colorizer.setup() end
end

local plugins_vscode = function ()
	require("user.treesitter")
	require("user.comment")
end

if vim.g.vscode then
	plugins_vscode()
else
	plugins()
end
