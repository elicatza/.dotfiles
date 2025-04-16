return {
  "L3MON4D3/LuaSnip",
  config = function()

    local ls = require("luasnip")

    ls.config.set_config {
      enable_autosnippets = true,
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

    require("elicatza.snippets.c")
    require("elicatza.snippets.tex")
    require("elicatza.snippets.org")
    require("elicatza.snippets.all")

  end,
}
