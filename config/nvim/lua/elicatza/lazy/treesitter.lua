return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    vim.opt.runtimepath:append("$HOME/.local/share/treesitter")
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      parser_install_dir = "$HOME/.local/share/treesitter",
      auto_install = false,
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        -- "org",
        "python",
        "rust",
        "toml",
        "typescript",
      },
      ignore_install = { },
      modules = { },
      sync_install = false,
      indent = { enable = true },
      additional_vim_regex_highlighting = false,
      highlight = {
        enable = true,
        disable = { "latex" },
      },
    })
  end,
}
