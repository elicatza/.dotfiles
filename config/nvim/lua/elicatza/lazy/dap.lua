return {
  "mfussenegger/nvim-dap",
  dependencies = {
  },

  config = function()

    local dap = require("dap")
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>dso", dap.step_over)
    vim.keymap.set("n", "<leader>dsi", dap.step_into)
    vim.keymap.set("n", "<leader>do", dap.repl.open)

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" },
    }

    dap.configurations.c = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
    }
  end,
}
