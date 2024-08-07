return {
  "freddiehaddad/feline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local cursor = require('feline.providers.cursor')
    local lsp = require('feline.providers.lsp')
    local vi_mode_utils = require('feline.providers.vi_mode')
    local file = require('feline.providers.file')
    local git = require('feline.providers.git')

    local function wrap(string)
      return " " .. string .. " "
    end


    local function wrap_left(string)
      return "  " .. string
    end

    local function wrap_right(string)
      return string .. "  "
    end

    local function wrapped_provider(provider, wrapper)
      return function(components, opts)
        return wrapper(provider(components, opts))
      end
    end

    local function provide_mode(components, opts)
      return vi_mode_utils.get_vim_mode()
    end

    local function provide_file_icon(components, opts)
      local filename = vim.fn.expand("%:t")
      local extention = vim.fn.expand("%:e")
      local icon = require('nvim-web-devicons').get_icon(filename, extention)
      if icon == nil then
        icon = ''
      end
      return icon
    end



    local function provide_path(components, opts)
      local filename = vim.fn.expand("%:t")
      if filename == "" then
        filename = "[no name]"
      end
      return filename .. " "
    end


    local fmt = string.format


    local c = {
      vi_mode = {
        provider = wrapped_provider(provide_mode, wrap),
        hl = function()
          return {
            name = vi_mode_utils.get_mode_highlight_name(),
            fg = vi_mode_utils.get_mode_color(),
            bg = 'gray',
            style = 'bold',
          }
        end,
      },

      file_icon = {
        provider = wrapped_provider(provide_file_icon, wrap_left),
        hl = {
          bg = 'blue',
          fg = 'b_white',
          style = 'bold',
        },
      },

      file_name = {
        provider = wrapped_provider(provide_path, wrap),

        update = { 'BufEnter' },

        hl = {
          bg = 'blue',
          fg = 'b_white',
          style = 'bold',
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
          str = 'right_filled',
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
          return fmt("%s ", cursor.scroll_bar("foo", { reverse = false }))
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
          return git.git_info_exists() ~= nil
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
          return git.git_info_exists() ~= nil
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
          return git.git_info_exists() ~= nil
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
        -- c.line_percentage,
        c.scroll_bar,
      },
    }


    local inactive = {
      { -- Left
      },
      { -- Right
      },
    }


    local theme = {
      type = { 'table', 'string' },
      update_default = true,

      bg = '#282828',
      fg = '#EBDBB2',

      black = '#282828',
      white = '#A89984',
      gray = '#504945',
      -- gray = '#3c3836',

      -- Normal
      red = '#CC241D',
      green = '#98971A',
      yellow = '#D79921',
      orange = '#D65D0E',
      blue = '#458588',
      purple = '#B16286',
      pink = '#FC5D7D',
      aqua = '#689D6A',

      -- Bright
      b_black = '#928374',
      b_red = '#FB4934',
      b_green = '#B8BB26',
      b_yellow = '#FABD2F',
      b_blue = '#83A598',
      b_purple = '#D3869B',
      b_aqua = '#8EC07C',
      b_white = '#EBDBB2',

      -- for filetype https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/themes/default.lua
      skyblue = '#83A598',
      oceanblue = '#83A598',
      cyan = '#689D6A',
      magenta = '#D3869B',
      violet = '#B16286',

    }

    local defaults = {
      vi_mode_colors = {
        ['NORMAL'] = 'green',
        ['OP'] = 'green',
        ['INSERT'] = 'orange',
        ['VISUAL'] = 'blue',
        ['LINES'] = 'blue',
        ['BLOCK'] = 'blue',
        ['REPLACE'] = 'purple',
        ['V-REPLACE'] = 'purple',
        ['COMMAND'] = 'red',
        ['TERM'] = 'red',
        ['NONE'] = 'yellow',
      },
    }
    require('feline').setup({
      theme = theme,
      vi_mode_colors = defaults.vi_mode_colors,
      components = { active = active, inactive = inactive },
    })
  end,
}
