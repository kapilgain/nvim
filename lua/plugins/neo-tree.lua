-- https://github.com/nvim-neo-tree/neo-tree.nvim#minimal-quickstart
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>n", "<cmd>Neotree<CR>", { desc = "Open NeoTree" })
  end,
}
