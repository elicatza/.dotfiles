---@diagnostic disable: undefined-global
-- local on_attach = function(client, bufnr)

-- end

local servers = {
  'bashls',
  'ccls',
  'hls',
  'html',
  'pyright',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
}

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = function()

      local opts = { noremap = true, silent = true, buffer = 0 }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', '<leader>ds', vim.diagnostic.get, opts)
      vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)

      vim.keymap.set("n", "<leader>fn", "<cmd>Telescope lsp_references<CR>", opts)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    end,

    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end

