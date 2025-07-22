vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false

vim.opt.list = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.foldenable = false
vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.completeopt = "menuone,noselect,popup"

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "html", "ocaml", "json" },
    callback = function ()
        local indent = 2
        vim.opt.tabstop = indent
        vim.opt.shiftwidth = indent
        vim.opt.softtabstop = indent
    end,
})

-- Command Anki that does it real good
local anki_augroup = vim.api.nvim_create_augroup("anki", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  group = anki_augroup,
  desc = "Add user command to add anki card",
  callback = function()
    vim.api.nvim_create_user_command("Anki",
      function(args)
        local filename = vim.api.nvim_buf_get_name(0)
        if args["args"] == "" then
          os.execute("wunderbar.py --force --file " .. filename)
        else
          os.execute("wunderbar.py --force --file " .. filename .. " --deck " .. args["args"])
        end
      end,
      {nargs = "?", complete = function()
        return {"deutsch", "school", "wunderbar", "GEO1100", "MAT1110"}
      end, desc = "Add buffer toml cards to anki deck"}
    )
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  group = anki_augroup,
  desc = "Color me",
  callback = function()
    local function visual_surround_pre_suf(pre, suf)
      local _, rs, cs = unpack(vim.fn.getpos('v'))
      local _, re, ce = unpack(vim.fn.getpos('.'))
      if rs ~= re then
        -- Note: Does not work over multiple lines
        return nil
      end

      if cs > ce then
        vim.api.nvim_buf_set_text(0, rs - 1, cs, rs - 1, cs, { suf })
        vim.api.nvim_buf_set_text(0, re - 1, ce -1, re - 1, ce - 1, { pre })
      else
        vim.api.nvim_buf_set_text(0, re - 1, ce, re - 1, ce, { suf })
        vim.api.nvim_buf_set_text(0, rs - 1, cs - 1, rs - 1, cs - 1, { pre })
      end
    end

    vim.keymap.set("v", '<leader>af', function()
      visual_surround_pre_suf("<span style='color: rgb(247, 168, 184);'>", "</span>" )
    end, { noremap = true })
    vim.keymap.set("v", '<leader>an', function()
      visual_surround_pre_suf("<span style='color: rgb(169, 169, 169);'>", "</span>" )
    end, { noremap = true })
    vim.keymap.set("v", '<leader>am', function()
      visual_surround_pre_suf("<span style='color: rgb(85, 205, 252);'>", "</span>" )
    end, { noremap = true })
  end,
})

vim.lsp.config['texlab'] = {
  cmd = { 'texlab' },
  filetypes = { 'tex' },
}
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
}
vim.lsp.enable('texlab')
vim.lsp.enable('lua_ls')


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local keyopts = { buffer = true }

    if client:supports_method('textDocument/hover') then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, keyopts)
    end
    if client:supports_method('textDocument/definition') then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, keyopts)
    end
    if client:supports_method('textDocument/declaration') then
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keyopts)
    end
    if client:supports_method('textDocument/reference') then
      vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, keyopts)
    end
    if client:supports_method('textDocument/signatureHelp') then
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, keyopts)
    end
    if client:supports_method('textDocument/signatureHelp') then
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, keyopts)
    end

  end,
})

