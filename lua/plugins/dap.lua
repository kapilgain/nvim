-- https://github.com/rcarriga/nvim-dap-ui#installation
return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    keys = {
      { "<leader>dc", ":lua require('dap').continue()<CR>" },
      { "<leader>dr", ":lua require('dap').repl.open()<CR>" },
      { "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>" },
      { "<leader>dB", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },
      { "<leader>dl", ":lua require('dap').run_last()<CR>" },
      { "<leader>do", ":lua require('dap').step_over()<CR>" },
      { "<leader>di", ":lua require('dap').step_into()<CR>" },
      { "<leader>du", ":lua require('dap').step_out()<CR>" },
      { "<leader>ds", ":lua require('dap').stop()<CR>" },
      { "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>" },
    },
    -- https://github.com/rcarriga/nvim-dap-ui#usage
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = "python",
    -- https://github.com/mfussenegger/nvim-dap-python#usage
    config = function()
      require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    end,
  },
}
