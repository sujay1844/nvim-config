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
	map({'n', 'i', 'v'}, '<A-h>', '<C-w>h')
	map({'n', 'i', 'v'}, '<A-j>', '<C-w>j')
	map({'n', 'i', 'v'}, '<A-k>', '<C-w>k')
	map({'n', 'i', 'v'}, '<A-l>', '<C-w>l')
	vim.g.tmux_navigator_no_mappings = 1
	map({'n', 'i', 'v'}, '<A-h>', ':TmuxNavigateLeft<CR>', { silent = true })
	map({'n', 'i', 'v'}, '<A-j>', ':TmuxNavigateDown<CR>', { silent = true })
	map({'n', 'i', 'v'}, '<A-k>', ':TmuxNavigateUp<CR>', { silent = true })
	map({'n', 'i', 'v'}, '<A-l>', ':TmuxNavigateRight<CR>', { silent = true })

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
