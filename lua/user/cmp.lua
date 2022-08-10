-- Setup nvim-cmp.
local vim = vim
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then return end
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then return end

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
	luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
	luasnip.expand_or_jump()
      --elseif check_backspace() then
	--fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
	cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
	luasnip.jump(-1)
      else
	fallback()
      end
    end, {
      "i",
      "s",
    }),
    --["<Esc>"] = cmp.mapping {
      --i = cmp.mapping.abort(),
      --c = cmp.mapping.close(),
    --},
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
		luasnip = "[Snippet]"
      })[entry.source.name]
      return vim_item
    end,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = true,
  },
  enabled = function()
    return vim.g.CmpToggle
  end
})

-- Toggle autocompletion
vim.g.CmpToggle = true
vim.api.nvim_create_user_command(
		"CmpEnable",
		"let g:CmpToggle = v:true",
		{}
)
vim.api.nvim_create_user_command(
		"CmpDisable",
		"let g:CmpToggle = v:false",
		{}
)

-- Rename variables using LSP
vim.api.nvim_create_user_command(
		"Rename",
		"lua vim.lsp.buf.rename()",
		{}
)
