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
  local word = vim.api.nvim_eval("expand('<cword>')")
  os.execute("firefox https://en.wiktionary.org/wiki/" .. word)
end, { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true })
vim.keymap.set("n", "<leader>flg", builtin.live_grep, { noremap = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true })
vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { noremap = true })
vim.keymap.set("n", "<leader>fgf", builtin.git_files, { noremap = true })
vim.keymap.set("n", "<leader>fo", function()
  builtin.find_files({ cwd= '~/doc/org', prompt_title = 'orgmode' })
end, { noremap = true })
