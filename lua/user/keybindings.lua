-- KEYBINDINGS

local vim = vim
vim.g.mapleader = " "
local map = vim.keymap.set

local keybindings = function ()
	-- Quit a window
	map('n', '<leader>q', '<Cmd>q<CR>')

	-- Create a new tab
	map('n', '<C-t>', '<Cmd>tabnew<CR><Cmd>Telescope oldfiles<CR>')
	map('i', '<C-t>', '<Esc><Cmd>tabnew<CR><Cmd>Telescope oldfiles<CR>')

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

	-- Telescope
	map('n', '<leader>ff', '<Cmd>Telescope find_files<CR>')
	map('n', '<leader>fb', '<Cmd>Telescope file_browser<CR>')
	map('n', '<leader>fr', '<Cmd>Telescope oldfiles<CR>')
	map('n', '<leader>fe', '<Cmd>Telescope symbols<CR>')
	map('n', '<leader>fs', '<Cmd>Telescope spell_suggest<CR>')
	map('n', '<leader>fi', '<Cmd>Telescope builtin<CR>')

	-- fuzzy finder
	map('n', '<A-f>', '<Cmd>Telescope find_files<CR>')
	map('n', '<leader>g', '<Cmd>Telescope live_grep<CR>')

	-- Terminal
	map('t', '<Esc>', '<C-\\><C-n>')
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
