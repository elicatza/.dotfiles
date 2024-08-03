vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "æ", "<Esc>")
vim.keymap.set('t', 'æ', '<C-\\><C-n>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>n", ":Oil<CR>")
vim.keymap.set("n", "<leader>vrc", ":e " .. vim.fn.stdpath('config') .. "<cr>")

vim.keymap.set('n', '<C-w>H', ':vert res -10<CR>')
vim.keymap.set('n', '<C-w>L', ':vert res +10<CR>')
vim.keymap.set('n', '<C-w>J', ':res -10<CR>')
vim.keymap.set('n', '<C-w>K', ':res +10<CR>')

-- Quickfixlist
vim.keymap.set('n', '<leader>qn', '<cmd>cnext<cr>', { silent = true, noremap = true, desc = 'quickfixlist next' } )
vim.keymap.set('n', '<leader>qp', '<cmd>cprev<cr>',  { silent = true, noremap = true, desc = 'quickfixlist prev' } )
vim.keymap.set('n', '<leader>qb', '<cmd>make<cr>',   { silent = true, noremap = true, desc = 'make' } )
vim.keymap.set('n', '<leader>qo', '<cmd>copen<cr>',  { silent = true, noremap = true, desc = 'open quickfixlist' } )
vim.keymap.set('n', '<leader>qc', '<cmd>cclose<cr>', { silent = true, noremap = true, desc = 'close quickfixlist' } )


-- Open word under cursor in wiktionary
vim.keymap.set("n", "<leader>ss", function()
  local spelllang = vim.api.nvim_get_option_value("spelllang", { scope = "local" })
  local word = vim.api.nvim_eval("expand('<cword>')")
  if spelllang == "en" then
    os.execute("firefox https://en.wiktionary.org/wiki/" .. word .. "#English")
  elseif spelllang == "de_DE" or spelllang == "de" then
    os.execute("firefox https://en.wiktionary.org/wiki/" .. word .. "#German")
  elseif spelllang == "nb" then
    os.execute("firefox https://ordbokene.no/bm,nn/search?q=" .. word)
  else
    os.execute("firefox https://en.wiktionary.org/wiki/" .. word)
  end
end, { noremap = true, silent = true })
