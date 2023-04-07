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
  conceallevel = 2,
  background = "dark",
  termguicolors = true,

  swapfile = false,
  backup = false,
  undodir = XDG_DATA_HOME .. "/nvim/undodir",
  completeopt = "menu,menuone,noselect",

  foldmethod = 'manual'
}

vim.g.netrw_browsex_support_remote = "zathura"
vim.g.netrw_banner = 0

vim.cmd.colorscheme("gruvbox")

local group = vim.api.nvim_create_augroup("MyGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "html" },
  callback = function()
    indent = 2
    vim.opt.tabstop = indent
    vim.opt.softtabstop = indent
    vim.opt.shiftwidth = indent
end, group = group })

for k, v in pairs(options) do
  vim.opt[k] = v
end
