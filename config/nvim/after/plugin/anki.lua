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
          print(vim.fn.system({ "wunderbar.py", "--force", "--file", filename }))
        else
          print(vim.fn.system({ "wunderbar.py", "--force", "--file", filename, "--deck", args["args"] }))
        end
      end,
      {nargs = "?", complete = function()
        return {"deutsch", "school", "wunderbar"}
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
        -- TODO: Add multiline visual selection support
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
      visual_surround_pre_suf("<span style=\"color: rgb(247, 168, 184);\">", "</span>" )
    end, { noremap = true, desc = "Surround highlight with anki color pink"  })
    vim.keymap.set("v", "<leader>an", function()
      visual_surround_pre_suf("<span style=\"color: rgb(169, 169, 169);\">", "</span>" )
    end, { noremap = true, desc = "Surround highlight with anki color gray"  })
    vim.keymap.set("v", '<leader>am', function()
      visual_surround_pre_suf("<span style=\"color: rgb(85, 205, 252);\">", "</span>" )
    end, { noremap = true, desc = "Surround highlight with anki color blue" })
    vim.keymap.set("v", '<leader>ac', function()
      visual_surround_pre_suf("{{c1::", "}}" )
    end, { noremap = true, desc = "Surround highlight with anki cloze" })
    vim.keymap.set("v", '<leader>al', function()
      visual_surround_pre_suf("[$]", "[/$]" )
    end, { noremap = true, desc = "Surround highlight with anki latex" })
  end,
})
