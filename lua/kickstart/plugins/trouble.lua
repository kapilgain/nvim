-- https://github.com/folke/trouble.nvim#lazynvim
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    -- https://github.com/folke/trouble.nvim#commands
    -- Lua
    vim.keymap.set("n", "<leader>xx", function()
      require("trouble").toggle("diagnostics")
    end, { desc = "Trouble: Toggle" })
    vim.keymap.set("n", "<leader>xw", function()
      require("trouble").toggle("workspace_diagnostics")
    end, { desc = "Trouble: Workspace Diagnostics" })
    vim.keymap.set("n", "<leader>xd", function()
      require("trouble").toggle("document_diagnostics")
    end, { desc = "Trouble: Document Diagnostics" })
    vim.keymap.set("n", "<leader>xq", function()
      require("trouble").toggle("quickfix")
    end, { desc = "Trouble: Quickfix" })
    vim.keymap.set("n", "<leader>xl", function()
      require("trouble").toggle("loclist")
    end, { desc = "Trouble: Loclist" })
    vim.keymap.set("n", "gR", function()
      require("trouble").toggle("lsp_references")
    end, { desc = "Trouble: LSP References" })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
