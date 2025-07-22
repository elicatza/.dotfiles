-- Note: using nf-dev-* icons from https://www.nerdfonts.com/cheat-sheet
local filetype_icons = {
  lua = "",
  c = "",
  html = "󰌝",
  javascript = "󰌞",
  markdown = "",
  python = "",
  rust = "",
  bash = "",
  org = "",
  tex = "",
}

local init_statusline = vim.api.nvim_create_augroup('init_statusline', {})
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'FocusGained' }, {
  desc = 'Set git branch',
  callback = function()
    if vim.fn.isdirectory '.git' ~= 0 then
      vim.b.branch_name = vim.fn.system "git branch --show-current | tr -d '\n'"
    end
  end,
  group = init_statusline,
})

vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  desc = 'Update statusline colorscheme when chinging colorscheme',
  callback = function()
    local status_bg = vim.api.nvim_get_hl(0, { name = "StatusLine", link = false }).bg
    local aqua = vim.api.nvim_get_hl(0, { name = "Macro", link = false }).fg
    local orange = vim.api.nvim_get_hl(0, { name = "Operator", link = false }).fg
    local red = vim.api.nvim_get_hl(0, { name = "Statement", link = false }).fg
    vim.api.nvim_set_hl(0, 'MyStatusAquaB', { fg = aqua, bg = status_bg, bold = true })
    vim.api.nvim_set_hl(0, 'MyStatusOrangeB', { fg = orange, bg = status_bg, bold = true })
    vim.api.nvim_set_hl(0, 'MyStatusRedB', { fg = red, bg = status_bg, bold = true })
    vim.api.nvim_set_hl(0, 'MyStatusB', { bg = status_bg, bold = true })
  end,
  group = init_statusline,
})

function _G._statusline_component(name)
  if name == "icon" then
    local filetype = vim.bo.filetype
    local icon = filetype_icons[filetype]
    return icon ~= nil and icon .. ' ' or filetype .. ' '

  elseif name == "lsp" then
    if vim.lsp.get_clients({bufnr = 0})[1] ~= nil then
      local errs = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      local warns = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      local hints = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      local errfmt = #errs ~= 0 and string.format('%%#MyStatusRedB# %s%%* ', #errs) or ''
      local warnfmt = #warns ~= 0 and string.format('%%#MyStatusOrangeB# %s%%* ', #warns) or ''
      local hintfmt = #hints ~= 0 and string.format('%%#MyStatusAquaB# %s%%* ', #hints) or ''
      return string.format('| %s%s%s%s', errfmt, warnfmt , hintfmt, vim.lsp.get_clients()[1].name)
    else
      return ""
    end

  elseif name == "git" then
    return vim.b.branch_name ~= nil and " " .. vim.b.branch_name or ""
  end
  return "Internal error: invalid statusline component: " .. name
end

local status_bg = vim.api.nvim_get_hl(0, { name = "StatusLine", link = false }).bg
local aqua = vim.api.nvim_get_hl(0, { name = "Macro", link = false }).fg
local orange = vim.api.nvim_get_hl(0, { name = "Operator", link = false }).fg
local red = vim.api.nvim_get_hl(0, { name = "Statement", link = false }).fg
vim.api.nvim_set_hl(0, 'MyStatusAquaB', { fg = aqua, bg = status_bg, bold = true })
vim.api.nvim_set_hl(0, 'MyStatusOrangeB', { fg = orange, bg = status_bg, bold = true })
vim.api.nvim_set_hl(0, 'MyStatusRedB', { fg = red, bg = status_bg, bold = true })
vim.api.nvim_set_hl(0, 'MyStatusB', { bg = status_bg, bold = true })


local statusline = {
  ' %{%v:lua._statusline_component("icon")%}',
  '%#MyStatusB#%t%* ',
  '%{%v:lua._statusline_component("lsp")%}',
  ' %{&spell ? &spelllang : ""}',
  '%= %#MyStatusB#',
  '%{%v:lua._statusline_component("git")%}',
  ' %3p%%',
  ' %3l:%-2c ',
}

vim.o.statusline = table.concat(statusline, '')
