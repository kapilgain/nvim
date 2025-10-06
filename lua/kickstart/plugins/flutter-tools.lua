return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    opts = {
      flutter_path = vim.fn.expand("~") .. "/develop/flutter/bin/flutter",
    },
  },
}
