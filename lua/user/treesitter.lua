local status_ok, config = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end
config.setup {
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
	rainbow = { enable = true}
}

-- Context aware folding using Treesitter

local vim = vim
local set = vim.opt
local cmd = vim.cmd

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
-- set.foldnestmax = 2
set.foldminlines = 2
set.foldenable = true
-- set.foldcolumn = "0"

-- Custom text
cmd[[
	function! MyFoldText() " {{{
		let line = getline(v:foldstart)

		let nucolwidth = &fdc + &number * &numberwidth
		let windowwidth = winwidth(0) - nucolwidth - 3
		let foldedlinecount = v:foldend - v:foldstart

		" expand tabs into spaces
		let onetab = strpart('          ', 0, &tabstop)
		let line = substitute(line, '\t', onetab, 'g')

		let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
		let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 10
		return line . '...' . repeat(" ",fillcharcount) . foldedlinecount . ' lines  '
	endfunction " }}}
	set foldtext=MyFoldText()
]]

-- Colorscheme for fold text
cmd[[
	highlight Folded guibg=#343a45 guifg=#afb9c5
]]
