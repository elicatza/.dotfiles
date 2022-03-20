local HOME = os.getenv("HOME")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps
vim.api.nvim_set_keymap("i", "æ", "<Esc>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>vrc", ":e " .. HOME .. "/.config/nvim/.<CR>", { noremap = true })

vim.keymap.set("n", "<leader>ss", function()
  local word = vim.api.nvim_eval("expand('<cword>')")
  -- local spell_lang = vim.api.nvim_eval("spellinfo")
  -- os.execute("firefox https://ordbokene.no/bm,nn/" .. word)
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

vim.keymap.set("n", "<leader>fh",function()
  require('telescope.builtin').help_tags()
end, { noremap = true })

