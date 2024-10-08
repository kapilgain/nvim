-- https://www.youtube.com/watch?v=i04sSQjd-qo
-- https://github.com/olexsmir/gopher.nvim
return {
  "olexsmir/gopher.nvim",
  ft = { "go", "gomod" },
  -- branch = "develop", -- if you want develop branch
  -- keep in mind, it might break everything
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
  },
  -- (optional) will update plugin's deps on every update
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  opts = {},
}
-- vim: ts=2 sts=2 sw=2 et
