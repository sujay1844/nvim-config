-- GENERAL

local vim = vim
local set = vim.opt
local api = vim.api

set.number = true
set.relativenumber = true
set.encoding = "utf-8"
set.hidden = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.updatetime = 300
set.history = 1000
set.mouse = "a"
set.scrolloff = 5
set.shell = "fish"

-- For me, keeping lines shorter than 100 characters is a good practice
set.colorcolumn = "100"

-- Use system clipboard
set.clipboard = 'unnamedplus'

-- Global statusline
set.laststatus = 3

-- Tab
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
--set.expandtab = true

-- Persistent-undo
set.undofile = true
api.nvim_create_autocmd(
	"FileReadPost",
	{
		pattern = "*",
		command = [[ rundo /home/sujay1844/.local/share/nvim/undo ]]
	}
)

-- Go to last cursor position
api.nvim_create_autocmd(
	"BufReadPost",
    {
		command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]]
	}
  )

-- Close help windows with q
api.nvim_create_autocmd(
	"FileType",
	{
		pattern = { "help", "startuptime", "qf", "lspinfo" },
		command = [[nnoremap <buffer><silent> q :close<CR>]]
	}
)

-- Enable spellcheck for certain filetypes only
api.nvim_create_autocmd(
	"FileType",
	{
		pattern = {
			"markdown",
			"md",
			"text",
			"latex",
			"tex",
		},
		command = [[ setlocal spell ]]
	}
)

-- Detect filetypes using lua (faster than vim)
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

function Usercmd(keyword, cmd, opts)
	vim.api.nvim_create_user_command(keyword, cmd, opts)
end

Usercmd("RunPython", "!python %", {})
Usercmd("RunGo", "!go run %", {})
Usercmd("RunBash", "!%", {})
Usercmd("RunJS", "!node %", {})

-- Exam mode
Usercmd(
	"MCQ",
	"imap <CR> <Esc>j$a | set nornu | CmpDisable",
	{}
)
