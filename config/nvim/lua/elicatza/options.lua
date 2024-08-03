vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. ".local/share/nvim/undodir"

vim.g.netrw_banner = 0

local indent_group = vim.api.nvim_create_augroup("Indent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "html", "ocaml", "json" },
    callback = function ()
        local indent = 2
        vim.opt.tabstop = indent
        vim.opt.shiftwidth = indent
        vim.opt.softtabstop = indent
    end,
    group = indent_group
})
