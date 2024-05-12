local servers = {
	"pyright",
	"gopls",
	"marksman",
	"yamlls",
	"bashls",
	"html",
	"lua_ls",
	"jsonls",
	"cssls",
	"tsserver",
	"rust_analyzer",
	"clangd",
	"nil_ls",
}
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then return end
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then return end
local caps = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
for i in ipairs(servers) do
	lspconfig[servers[i]].setup { capabilities = caps }
end
require("mason-lspconfig").setup {
    ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"elixirls",
	},
}

