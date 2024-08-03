return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
  },

  config = function()
    -- require("elicatza.lalsps")

    -- require('vim.lsp.log')
    -- vim.lsp.set_log_level('debug')
    -- require('vim.lsp.log').set_format_func(vim.inspect)

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)

        local opts = { buffer = ev.buf, silent = true, noremap = true }
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>df", function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })

    local lspconfig = require("lspconfig")
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- lspconfig.lalsps.setup({ capabilities = lsp_capabilities })
    -- lspconfig.ccls.setup({ capabilities = lsp_capabilities })
    lspconfig.texlab.setup({ capabilities = lsp_capabilities })
    lspconfig.ocamllsp.setup({ capabilities = lsp_capabilities })

    lspconfig.lua_ls.setup({
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library ={
              vim.fn.stdpath('data'),
              vim.fn.stdpath('config'),
            },
          },
        }
      }
    })


    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
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
      }),

      --[[
    cmp.setup.filetype('org', {
      sources = cmp.config.sources({
        { name = 'orgmode' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 3, max_item_count = 4 },
      })
    }),
      --]]

      cmp.setup.filetype({ 'c', 'help' }, {
      }),

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer', keyword_length = 3 }
        }
      }),

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path', keyword_length = 2 },
          { name = 'cmdline', keyword_length = 2 }
        })
      })
    })


  end,
}
