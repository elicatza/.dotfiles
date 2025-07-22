vim.pack.add({
  'https://github.com/ellisonleao/gruvbox.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-orgmode/orgmode',

  -- Nvim-cmp and optional dependencies
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/hrsh7th/cmp-buffer',
  'https://github.com/hrsh7th/cmp-path',
  'https://github.com/hrsh7th/cmp-cmdline',
  'https://github.com/delphinus/cmp-ctags',
  'https://github.com/saadparwaiz1/cmp_luasnip',
  {
    src = 'https://github.com/L3MON4D3/LuaSnip',
    version = vim.version.range('^2.4.0'),
  },
})

-- Gruvbox config
vim.opt.background = "dark"
vim.cmd.colorscheme("gruvbox")

-- Telescope config
local function telescope_setup()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})
    end)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<leader>fb", builtin.buffers)
    vim.keymap.set("n", "<leader>fh", function() builtin.help_tags() end)
    vim.keymap.set("n", "<leader>fm", function() builtin.man_pages({ sections = { "ALL" } }) end)
end

telescope_setup()

-- Treesitter config
local ts_parsers = {
        "bash", "c", "cmake", "css", "html", "javascript", "json", "lua",
        "make", "markdown", "python", "latex", "rust", "toml", "typescript",
}
local function treesitter_setup()
  local nts = require("nvim-treesitter")
  nts.install(ts_parsers)

  vim.api.nvim_create_autocmd({ 'PackChanged' }, {
    desc = 'Make sure installed parsers maches TS version',
    callback = function(args)
      local spec = args.data.spec
      if spec and spec.name == "nvim-treesitter" and args.data.kind == "update" then
        vim.notify("Updating parsers to match nvim-treesitter version", vim.log.levels.INFO)
        vim.schedule(function() nts.update() end)
      end
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    desc = 'Enable parser when \'filetype\' is set',
    callback = function(args)
      local filetype = args.match
      local lang = vim.treesitter.language.get_lang(filetype)
      if vim.treesitter.language.add(lang) and lang ~= 'org' then
        vim.treesitter.start(args.buf, lang)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      end
    end,
  })
end

treesitter_setup()

require("oil").setup({})

require('orgmode').setup({
  org_agenda_files = { '~/doc/org/agenda/**/*' },
  org_default_notes_file = '~/doc/org/todo.org',
  org_archive_location = '~/doc/org/archive/agenda/calendar.org',
  org_hide_leading_stars = true,
  org_hide_emphasis_markers = true,


  org_highlight_latex_and_related = 'entities',
  org_capture_templates = {
    d = {
      description = 'Diary',
      template = '\n** %<%Y-%m-%d> %<%A>\n*** %U\n    %?',
      target = '~/doc/org/diary.org'
    },

    t = 'Task',
    ts = {
      description = 'schedule',
      template = '** TODO %?\n   SCHEDULED: %t\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    },
    td = {
      description = 'deadline',
      template = '** TODO %?\n   DEADLINE: %t\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    },
    tt = {
      description = 'task',
      template = '** TODO %?\n   %t\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    },

    e = 'Event',
    er = {
      description = 'recurring',
      template = '** %?\n   SCHEDULED: %T\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    },
    eo = {
      description = 'once',
      template = '** %?\n   SCHEDULED: %T\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    }
  }
})

local function luasnip_setup()
    local ls = require("luasnip")

    ls.config.set_config {
      enable_autosnippets = true,
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, opts)


    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if ls.jumpable() then
        ls.jump(-1)
      end
    end, opts)

    vim.keymap.set({ "i", "s" }, "<c-l>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, opts)

    vim.keymap.set({ "i", "s" }, "<c-h>", function()
      if ls.choice_active() then
        ls.change_choice(-1)
      end
    end, opts)

    require("elicatza.snippets.c")
    require("elicatza.snippets.tex")
    require("elicatza.snippets.org")
    require("elicatza.snippets.all")
end

luasnip_setup()

local function cmp_setup()
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
        { name = 'buffer', keyword_length = 3, max_item_count = 4, option = { keyword_pattern = [[\k\+]] } },
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

      cmp.setup.filetype({ 'c', 'h' }, {
        sources = {
          { name = 'ctags', keyword_length = 3 },
          { name = 'path' },
          { name = 'buffer', keyword_length = 3, max_item_count = 4 },
        }
      }),

      cmp.setup.filetype({ 'oil' }, {
        sources = {
          { name = 'luasnip' },
          { name = 'buffer', keyword_length = 3, max_item_count = 4 },
        }
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
end

cmp_setup()
