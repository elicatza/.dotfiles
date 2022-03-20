local cursor = require('feline.providers.cursor')
local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
local file = require('feline.providers.file')


-- [1] = Left
-- [2] = Middle
-- [3] = Right


local my_theme = {
  bg = '#282828',
  fg = '#ebdbb2',

  gray = '#3c3836',

  -- Normal
  black =   '#282828',
  red =     '#cc241d',
  green =   '#98971a',
  yellow =  '#d79921',
  orange  = '#d65d0e',
  blue =    '#458588',
  purple =  '#b16286',
  pink =    '#fc5d7d',
  aqua =    '#689d6a',
  white =   '#a89984',

  -- Bright
  b_black =   '#928374',
  b_red =     '#fb4934',
  b_green =   '#b8bb26',
  b_yellow =  '#fabd2f',
  b_blue =    '#83a598',
  b_purple = '#d3869b',
  b_aqua =    '#8ec07c',
  b_white =   '#ebdbb2',
}

local fmt = string.format

local c = {
  vi_mode = {
    provider = function()
      return fmt(" %s ", vi_mode_utils.get_vim_mode())
    end,

    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
        bg = my_theme.gray,
        style = 'bold',
      }
    end,
    right_sep = {
      str = 'slant_right',
      hl = {
        bg = my_theme.blue,
        fg = my_theme.gray,
      },
    },
  },

  file_icon = {
    provider = function()
      local filename = vim.fn.expand("%:t")
      local extention = vim.fn.expand("%:e")
      local icon = require('nvim-web-devicons').get_icon(filename, extention)
      if icon == nil then
        icon = ''
      end
      return icon .. ' '
    end,
    hl = {
      bg = my_theme.blue,
      style = 'bold',
    },
    left_sep = {
      str = 'block',
    },
  },

  file_name = {
    provider = function()
      if (vim.fn.expand("%:t") == "") then
        return "[No Name]"
      end

      return vim.fn.expand("%:t") .. ' '
    end,

    update = { 'BufEnter' },

    hl = {
      bg = my_theme.blue,
      fg = my_theme.b_white,
      style = 'bold',
    },
    right_sep = {
      str = 'slant_left',
      hl = {
        fg = my_theme.pink,
        bg = my_theme.blue,
      },
    },
  },

  lsp_errors = {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
    hl = {
      fg = my_theme.red,
      bg = my_theme.pink,
      style = 'bold',
    },
  },

  lsp_warnings = {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
    hl = {
      fg = my_theme.orange,
      bg = my_theme.pink,
      style = 'bold',
    },
  },

  lsp_hints = {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
    hl = {
      fg = my_theme.white,
      bg = my_theme.pink,
      style = 'bold',
    },
  },

  lsp_client = {
    provider = function()
      return fmt(' %s ', lsp.lsp_client_names())
    end,
    enabled = function()
      return next(vim.lsp.buf_get_clients(0)) ~= nil
    end,
    hl = {
      bg = my_theme.pink,
      style = 'bold',
    },
    right_sep = {
      str = 'slant_right',
      hl = {
        fg = my_theme.pink,
        bg = my_theme.gray,
      },
    },
  },

  spell_lang = {
    provider = function()
      return fmt(" %s ", vim.api.nvim_eval('&spelllang'))
    end,
    enabled = function()
      if (next(vim.lsp.buf_get_clients(0)) ~= nil) then
        return false
      end

      local spellState = vim.api.nvim_eval('&spell')
      if (spellState == 0) then
        return false
      end

      return true
    end,
    hl = {
      bg = my_theme.pink,
      style = 'bold',
    },
    right_sep = {
      str = 'slant_right',
      hl = {
        fg = my_theme.pink,
        bg = my_theme.gray,
      },
    },
  },

  file_encoding = {
    provider = function()
      return fmt(" %s ", file.file_encoding())
    end,
    enabled = function()
      if (next(vim.lsp.buf_get_clients(0)) ~= nil) then
        return false
      end


      local spellState = vim.api.nvim_eval('&spell')
      if (spellState == 1) then
        return false
      end

      return true
    end,
    hl = {
      bg = my_theme.pink,
      style = 'bold',
    },
    right_sep = {
      str = 'slant_right',
      hl = {
        fg = my_theme.pink,
        bg = my_theme.gray,
      },
    },
  },


  -- Right side
  scroll_bar = {
    provider = 'scroll_bar',
  },

  line_percentage = {
    provider = 'line_percentage',
  },

  position = {
    provider = 'position',
  },

  git_branch = {
    provider = 'git_branch',
  },
}


local active = {
  { -- Left
    c.vi_mode,
    c.file_icon,
    c.file_name,
    c.lsp_errors,
    c.lsp_warnings,
    c.lsp_hints,

    -- lsp_client -> If no client -> spell_lang -> if no spelllang -> file_encoding
    c.lsp_client,
    c.spell_lang,
    c.file_encoding,
  },

  { -- Right
    c.git_branch,
    c.position,
    c.line_percentage,
    c.scroll_bar,
  },
}

local inactive = {
  { -- Left
  },
  { -- Right
  },
}


require('feline').setup({
  default_bg = my_theme.b_black,
  default_fg = my_theme.white,
  components = { active = active, inactive = inactive },
  force_inactive = {
    filetypes = {
      "NvimTree",
      "packer",
      "dap-reql",
      "dapui_scopes",
      "dapui_stacks",
      "dapui_repl",
      "LspTrouble",
      "qf",
      "help",
    },
    buftypes = { "terminal" },
    bufnames = {},
  },
})
