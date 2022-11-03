-- List of servers
local servers = {
	"pyright",
	"sumneko_lua",
	"gopls",
	"marksman",
	"yamlls",
	"bashls",
	"html",
	"jsonls",
	"cssls",
	"tsserver",
	"rust_analyzer",
	"clangd",
}
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then return end
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then return end
local caps = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
for i in ipairs(servers) do
	lspconfig[servers[i]].setup { capabilities = caps }
end

-- Auto install servers
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end
lsp_installer.setup({ 
	ensure_installed = servers,
	automatic_installation = true,
	max_concurrent_installers = 5,
	ui = {
		check_outdated_servers_on_open = true,
	}
})
