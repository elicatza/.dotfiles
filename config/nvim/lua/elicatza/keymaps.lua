
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps
vim.api.nvim_set_keymap("i", "æ", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "æ", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true})
vim.api.nvim_set_keymap("v", "K", ":m '>-2<CR>gv=gv", { noremap = true})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set('n', '<C-w>H', ':vert res -10<CR>', { noremap = true })
vim.keymap.set('n', '<C-w>L', ':vert res +10<CR>', { noremap = true })
vim.keymap.set('n', '<C-w>J', ':res -10<CR>', { noremap = true })
vim.keymap.set('n', '<C-w>K', ':res +10<CR>', { noremap = true })

-- Quickfixlist
vim.keymap.set('n', '<leader>qn', '<cmd>cnext<cr>',  { silent = true, noremap = true, desc = 'quickfixlist next' } )
vim.keymap.set('n', '<leader>qp', '<cmd>cprev<cr>',  { silent = true, noremap = true, desc = 'quickfixlist prev' } )
vim.keymap.set('n', '<leader>qb', '<cmd>make<cr>',   { silent = true, noremap = true, desc = 'make' } )
vim.keymap.set('n', '<leader>qo', '<cmd>copen<cr>',  { silent = true, noremap = true, desc = 'open quickfixlist' } )
vim.keymap.set('n', '<leader>qo', '<cmd>cclose<cr>', { silent = true, noremap = true, desc = 'close quickfixlist' } )

vim.keymap.set('t', 'æ', '<C-\\><C-n>', { noremap = true })
-- tnoremap <Esc> <C-\><C-n>

vim.api.nvim_set_keymap("n", "<leader>vrc", ":e " .. vim.fn.stdpath('config') .. "<CR>", { noremap = true })

-- Open word under cursor in english wiktionary
vim.keymap.set("n", "<leader>ss", function()
  local word = vim.api.nvim_eval("expand('<cword>')")
  os.execute("firefox https://en.wiktionary.org/wiki/" .. word)
end, { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true })
-- vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ hidden = true }) end, { noremap = true })
vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})
  end, { noremap = true })
vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { noremap = true })
vim.keymap.set("n", "<leader>fgf", builtin.git_files, { noremap = true })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true })
vim.keymap.set("n", "<leader>flg", builtin.live_grep, { noremap = true })
vim.keymap.set("n", "<leader>fo", function()
  builtin.find_files({ cwd= '~/doc/org', prompt_title = 'orgmode' })
end, { noremap = true })
