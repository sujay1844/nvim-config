require("telescope").setup{
	extensions = {
		file_browser = {
			hijack_netrw = true,
		}
	}
}
-- require'telescope.builtin'.symbols{ sources = "emoji"}
require('telescope').load_extension "file_browser"
