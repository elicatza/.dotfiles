local cursor = require('feline.providers.cursor')
local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
local file = require('feline.providers.file')
local git = require('feline.providers.git')


-- [1] = Left
-- [2] = Middle
-- [3] = Right


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
        bg = 'gray',
        style = 'bold',
      }
    end,
    right_sep = {
      str = 'slant_right',
      hl = {
        bg = 'blue',
        fg = 'gray',
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
      bg = 'blue',
      fg = 'b_white',
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
      bg = 'blue',
      fg = 'b_white',
      style = 'bold',
    },
    right_sep = {
      str = 'slant_left',
      hl = {
        fg = 'pink',
        bg = 'blue',
      },
    },
  },

  lsp_errors = {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
    hl = {
      fg = 'red',
      bg = 'pink',
      style = 'bold',
    },
  },

  lsp_warnings = {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
    hl = {
      fg = 'b_yellow',
      bg = 'pink',
      style = 'bold',
    },
  },

  lsp_hints = {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
    hl = {
      fg = 'b_white',
      bg = 'pink',
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
      bg = 'pink',
      fg = 'b_white',
      style = 'bold',
    },
    right_sep = {
      str = 'slant_right',
      hl = {
        fg = 'pink',
        bg = 'gray',
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
      bg = 'pink',
      style = 'bold',
    },
    right_sep = {
      str = 'slant_right',
      hl = {
        fg = 'pink',
        bg = 'gray',
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
      bg = 'pink',
      style = 'bold',
    },
    right_sep = {
      str = 'slant_right',
      hl = {
        fg = 'pink',
        bg = 'gray',
      },
    },
  },


  -- Right side
  scroll_bar = {
    provider = function()
      return fmt("%s ", cursor.scroll_bar())
    end,
    hl = {
      bg = 'gray',
      fg = 'pink',
    },
  },

  line_percentage = {
    provider = function()
      return fmt(" %s ", cursor.line_percentage())
    end,
    hl = {
      bg = 'gray',
      fg = 'b_white',
    },
    left_sep = {
      str = 'left',
      hl = {
        bg = 'gray',
        fg = 'black',
      },
    },
  },

  position = {
    provider = function()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      col = vim.str_utfindex(vim.api.nvim_get_current_line(), col) + 1
      return fmt(" %d:%d ", row, col)
    end,
    hl = {
      bg = 'gray',
      fg = 'b_white',
    },
    left_sep = {
      str = 'left_filled',
      hl = {
        bg = 'blue',
        fg = 'gray',
      },
    },
  },

  git_branch = {
    provider = function()
      return fmt("  %s ", vim.b.gitsigns_head)
    end,
    enabled = function()
      return require('feline.providers.git').git_info_exists() ~= nil
    end,

    hl = {
      bg = 'blue',
      fg = 'b_white',
      style = 'bold',
    },
    left_sep = {
      str = 'left_filled',
      hl = {
        bg = 'green',
        fg = 'blue',
      },
    },
  },

  git_diff_added = {
    provider = function()
      local gsd = vim.b.gitsigns_status_dict

      if gsd and gsd['added'] and gsd['added'] > 0 then
        return fmt(" %s ", vim.b.gitsigns_status_dict['added'])
      else
        return " "
      end
    end,
    enabled = function()
      return require('feline.providers.git').git_info_exists() ~= nil
    end,
    hl = {
      bg = 'green',
      fg = 'black',
      style = 'bold',
    },
    left_sep = {
      str = 'left_filled',
      always_visible = true,
      hl = {
        bg = 'yellow',
        fg = 'green',
      },
    },
  },

  git_diff_changed = {
    provider = function()
      local gsd = vim.b.gitsigns_status_dict

      if gsd and gsd['changed'] and gsd['changed'] > 0 then
        return fmt(" %s ", vim.b.gitsigns_status_dict['changed'])
      else
        return " "
      end
    end,
    enabled = function()
      return require('feline.providers.git').git_info_exists() ~= nil
    end,
    hl = {
      bg = 'yellow',
      fg = 'black',
      style = 'bold',
    },
    left_sep = {
      str = 'left_filled',
      always_visible = true,
      hl = {
        bg = 'red',
        fg = 'yellow',
      },
    },
  },

  git_diff_removed = {
    provider = function()
      local gsd = vim.b.gitsigns_status_dict

      if gsd and gsd['removed'] and gsd['removed'] > 0 then
        return fmt(" %s ", vim.b.gitsigns_status_dict['removed'])
      else
        return " "
      end
    end,
    enabled = function()
      return require('feline.providers.git').git_info_exists() ~= nil
    end,
    hl = {
      bg = 'red',
      fg = 'black',
      style = 'bold',
    },
    left_sep = {
      str = 'left_filled',
      always_visible = true,
      hl = {
        bg = 'gray',
        fg = 'red',
      },
    },
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
    c.git_diff_removed,
    c.git_diff_changed,
    c.git_diff_added,
    c.git_branch,
    -- TODO add alternative for git
    -- Ideas: spacewidth...
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

local custom_defaults = require('elicatza.feline.custom_defaults')

require('feline').setup({
  theme = custom_defaults,
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
