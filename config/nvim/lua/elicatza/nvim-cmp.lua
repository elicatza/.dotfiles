local cmp = require('cmp')

cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3, max_item_count = 4 },
    -- { name = 'cmdline' },
  }),

}

-- Set configuration for specific filetype.
cmp.setup.filetype('org', {
  sources = cmp.config.sources({
    -- FIX: Causes orgmode to use up all ram
    -- Solution pkill -9 nvim
    { name = 'orgmode' }, -- You can specify the `cmp_git` source if you were installed it.
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 3, max_item_count = 4 },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer', keyword_length = 3 }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path', keyword_length = 2 },
    { name = 'cmdline', keyword_length = 2 }
  })
})


-- Setup LSP completion
-- local my_lsp_servers = {
  -- 'bashls',
  -- 'ccls',
  -- 'hls',
  -- 'html',
  -- 'pyright',
  -- 'rust_analyzer',
  -- 'sumneko_lua',
  -- 'tsserver',
-- }

-- for _, lsp in pairs(my_lsp_servers) do
  -- require('lspconfig')[lsp].setup {
    -- capabilities = capabilities
  -- }
-- end

