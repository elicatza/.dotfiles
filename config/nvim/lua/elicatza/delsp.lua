local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'
local configs = require 'lspconfig.configs'

local bin_name = 'delsp'
local cmd = { bin_name, '--stdio' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, 'start' }
end

if not configs.delsp then
  configs.delsp = {
    default_config = {
      cmd = cmd,
      filetypes = { 'org', 'markdown' },
      root_dir = util.find_git_ancestor,
      single_file_support = true,
      settings = {},
    },
    docs = {
      description = [[
      Test config for custom lsp: delsp
      ]],
      default_config = {
        root_dir = [[util.find_git_ancestor]],
      },
    },
  }
end
