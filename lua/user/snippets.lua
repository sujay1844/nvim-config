local vim = vim
-- Loading VS code snippets
local status_ok, vs_code = pcall(require, "luasnip.loaders.from_vscode")
if status_ok then vs_code.lazy_load({ paths = { "./lua/user/snippets" }}) end
if status_ok then vs_code.lazy_load() end

-- Then our custom snippets
local status_ok, ls = pcall(require, "luasnip")
if not status_ok then return end

ls.add_snippets( "all", {
	ls.parser.parse_snippet(
		"test",
		"This is a test snippet"
	),
	ls.parser.parse_snippet(
		"test2",
		"This is another ${1:test} snippet. With arguements ${2:arg1}\n ${3:arg2}\n$0"
	),
	ls.parser.parse_snippet(
		"multi-line string",
		[[
This is a multi-line snippet without \\n
${1:arg1} and ${2:arg2} and ${3:arg3}
$0
		]]
	),
	ls.parser.parse_snippet(
		"concatenated-string",
		"This is a concatenated-string \n"..
		"${1:arg1} and ${2:arg2} \n"..
		"$0"
	),
})

ls.add_snippets( "lua", {
	ls.parser.parse_snippet(
		"protected-require",
		[[
local status_ok, ${1:local_name} = pcall(require, "${2:module}")
if ${3:not} status_ok then ${4:return} end]]
	),

})

ls.add_snippets( "python", {
	ls.parser.parse_snippet(
		"help-message",
		[[
# Help message
help_message = """
${3:This is a help message}

Usage: $TM_FILENAME_BASE [-h] ${2:args}
Options:
    -h, --help show this help message and exit
"""
try:
    if sys.argv[1] == "-h" or sys.argv[1] == "--help":
        print(help_message)
        sys.exit(0)
except IndexError:
    print(help_message)
    sys.exit(0)
$0 ]]
	),
	ls.parser.parse_snippet(
		"import",
		[[
# Import or auto-install if modules are not found
imports = [${1:modules}]

import sys, subprocess
for module in imports:
    try:
        exec("import {module}".format(module=module))
    except ModuleNotFoundError as e:
        try:
            subprocess.check_call([sys.executable, '-m', 'pip', 'install', 
    module])
            exec("import {module}".format(module=module))
        except Exception:
            print("Modules could not be imported")
            exit(1)
$0 ]]
	)
})

ls.add_snippets( "markdown", {
	ls.parser.parse_snippet(
		"template",
		[[
---
tags: ${1:tag1, tag2}
date: $CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DATE
---

# ${2:title}
$0

---
# References
		]]
	),
	ls.parser.parse_snippet(
		"kbd",
		"<kbd>${1:Alt+F4}</kbd>$0"
	),
})

-- Autoload snippets when this file is saved
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = { "snippets.lua" },
		command = [[ source <afile> | echo "Snippets reloaded" ]]
	}
)

