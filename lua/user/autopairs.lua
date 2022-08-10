local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then return end
local status_ok, cond = pcall(require, "nvim-autopairs.conds")
if not status_ok then return end 
local status_ok, Rule = pcall(require, "nvim-autopairs.rule")
if not status_ok then return end 

npairs.setup({
	disable_filetype = { "vim", "fzf" },
	check_ts = true,
	ts_config = {
		lua = {"string"},
		javascript = {"template_string"},
		java = false,
	},
	enable_check_bracket_line = false,
})
-- Custom rules
npairs.add_rules({
	Rule("*", "*", "markdown"),
	Rule("<", ">", "markdown"),
	Rule("<", ">", "html")
		:with_cr(cond.none()),
})

-- If you want insert `(` after select function or method item
local status_ok, autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not status_ok then return end
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then return end
cmp.event:on(
  "confirm_done",
  autopairs.on_confirm_done()
)
