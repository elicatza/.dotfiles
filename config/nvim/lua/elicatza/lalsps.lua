
-- local lspconfig = require 'lspconfig'
-- local util = require 'lspconfig.util'
-- local configs = require 'lspconfig.configs'
--
-- local bin_name = 'lalsps'
-- local cmd = { bin_name }
--
-- -- if vim.fn.has 'win32' == 1 then
-- --   cmd = { 'cmd.exe', '/C', bin_name, 'start' }
-- -- end
--
-- if not configs.lalsps then
--   configs.lalsps = {
--     default_config = {
--       cmd = cmd,
--       filetypes = { 'org', 'markdown' },
--       root_dir = util.find_git_ancestor,
--       single_file_support = true,
--       settings = {},
--     },
--     docs = {
--       description = [[
--       Test config for custom lsp: lalsps
--       ]],
--       default_config = {
--         root_dir = [[util.find_git_ancestor]],
--       },
--     },
--   }
-- end