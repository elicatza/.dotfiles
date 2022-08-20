local CONF_DIR = os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps
vim.api.nvim_set_keymap("i", "æ", "<Esc>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>vrc", ":e " .. CONF_DIR .. "/nvim/init.lua<CR>", { noremap = true })

-- Open word under cursor in wiktionary
vim.keymap.set("n", "<leader>ss", function()
  local word = string.lower(vim.api.nvim_eval("expand('<cword>')"))
  os.execute("firefox https://en.wiktionary.org/wiki/" .. word)
  print(word)
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

