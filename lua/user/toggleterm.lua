local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then return end

toggleterm.setup{
	open_mapping = [[<c-\>]],
	direction = "float",
	size = 20,
	auto_scroll = true,
	float_opts = {
		border = 'curved'
	},
	close_on_exit = true,
}
