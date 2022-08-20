local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config {
  -- Alows you to use snippet after you've move outside it
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      }
    }
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, opts)


vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable() then
    ls.jump(-1)
  end
end, opts)

vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, opts)

vim.keymap.set({ "i", "s" }, "<c-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, opts)

vim.keymap.set({ "n" }, "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/elicatza/snippets/snippets.lua<CR>", opts)
