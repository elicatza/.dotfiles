local CONF_DIR = os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps
vim.api.nvim_set_keymap("i", "æ", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "æ", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true})
vim.api.nvim_set_keymap("v", "K", ":m '>-2<CR>gv=gv", { noremap = true})

vim.api.nvim_set_keymap("n", "<leader>vrc", ":e " .. CONF_DIR .. "/nvim/init.lua<CR>", { noremap = true })

-- Open word under cursor in wiktionary
vim.keymap.set("n", "<leader>ss", function()
  local word = string.lower(vim.api.nvim_eval("expand('<cword>')"))
  os.execute("firefox https://en.wiktionary.org/wiki/" .. word)
end, { noremap = true, silent = true })

vim.keymap.set("v", "<leader>cd", function()
  local vstart = vim.fn.getcharpos("'<")
  local vend = vim.fn.getcharpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  -- or use api.nvim_buf_get_lines
  local lines = table.concat(vim.fn.getline(line_start, line_end))
  vim.cmd("terminal gramma -l de-DE listen '" .. lines .. "'")
  -- os.execute("notify-send 'test' ' " .. lines .. "'")
  print(lines)
end, { noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<leader>ff", function()
  require('telescope.builtin').find_files()
end, { noremap = true })

vim.keymap.set("n", "<leader>fg", function()
  require('telescope.builtin').live_grep()
end, { noremap = true })

vim.keymap.set("n", "<leader>fb", function()
  require('telescope.builtin').buffers()
end, { noremap = true })

vim.keymap.set("n", "<leader>fh", function()
  require('telescope.builtin').help_tags()
end, { noremap = true })

vim.keymap.set("n", "<leader>fo", function()
  require'telescope.builtin'.find_files({ cwd = '~/doc/org', prompt_title = 'orgmode' })
end, { noremap = true })

