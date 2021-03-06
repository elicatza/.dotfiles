local XDG_DATA_HOME = os.getenv("XDG_DATA_HOME") or os.getenv("HOME") .. "/.local/share"
local indent = 4

local options = {
  tabstop = indent,
  softtabstop = indent,
  shiftwidth = indent,
  expandtab = true,
  smartindent = true,

  guicursor = "n-v-r-c-ci-sm-i-o:block,ve:ver25,cr:hor20",
  relativenumber = true,
  number = true,
  hlsearch = false,
  incsearch = true,
  scrolloff = 8,
  signcolumn = 'yes',
  colorcolumn = "120",
  wrap = false,
  laststatus = 3,
  conceallevel = 2, -- Vim-Markdown

  swapfile = false,
  backup = false,
  undodir = XDG_DATA_HOME .. "/nvim/undodir",

  completeopt = "menu,menuone,noselect",
}

vim.g.mkdp_auto_close = 0 -- MarkdownPreview
-- vim.g.vim_markdown_folding_disabled = 1
-- vim.g.vim_markdown_conceal = 1


vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[ colorscheme gruvbox ]])
vim.cmd([[ highlight WinSeparator guibg=None ]])
vim.cmd([[ set termguicolors ]])

local group = vim.api.nvim_create_augroup("MyGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "html" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
end, group = group })

for k, v in pairs(options) do
  vim.opt[k] = v
end
