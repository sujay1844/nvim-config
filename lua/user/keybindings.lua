-- KEYBINDINGS

local vim = vim
vim.g.mapleader = " "
local map = vim.keymap.set

local keybindings = function ()
	-- Quit a window
	map('n', '<leader>q', '<Cmd>q<CR>')

	-- Create a new tab
	map('n', '<C-t>', '<Cmd>tabnew<CR><Cmd>FZF<CR>')
	map('i', '<C-t>', '<Esc><Cmd>tabnew<CR><Cmd>FZF<CR>')

	-- Tab navigation
	map('n', '<A-h>', '<C-w>h')
	map('n', '<A-j>', '<C-w>j')
	map('n', '<A-k>', '<C-w>k')
	map('n', '<A-l>', '<C-w>l')
	map('i', '<A-h>', '<C-w>h')
	map('i', '<A-j>', '<C-w>j')
	map('i', '<A-k>', '<C-w>k')
	map('i', '<A-l>', '<C-w>l')

	-- file-tree
	map('n', '<leader>e', '<Cmd>wincmd v<bar> :Ex <CR><Cmd>FZF<CR>')
	map('n', '<leader>f', '<Cmd>Ex<CR>')

	-- FZF
	map('n', '<A-f>', '<Cmd>FZF<CR>')
end

if not vim.g.vscode then
	keybindings()
end

-- Markdown
-- map('n', '<leader>mt', '<Cmd>w !md-tangle -f %<CR><CR>:echom Tangled<CR>')
vim.api.nvim_create_user_command(
	"MDTangle",
	"w !md-tangle -f % | echom Tangled",
	{}
)
