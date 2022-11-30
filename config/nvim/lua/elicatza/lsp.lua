---@diagnostic disable: undefined-global

local opts = { noremap = true, silent = true }


local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>fd", function() require('telescope.builtin').diagnostics() end, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

  vim.keymap.set("n", "<leader>fr", function() require('telescope.builtin').lsp_references() end, opts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
end


local lspconfig = require 'lspconfig'

local my_lsps = {
  'bashls',
  'ccls',
  'delsp',
  'hls',
  'html',
  'texlab',
  -- 'pyright',
  'sumneko_lua',
  'tsserver',
  'pylsp',
  -- 'rust_analyzer',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(my_lsps) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end



lspconfig['rust_analyzer'].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
})
