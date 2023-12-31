-- https://github.com/williamboman/mason-lspconfig.nvim#setup
return {
  -- https://github.com/williamboman/mason.nvim#lazynvim
  {
    "williamboman/mason.nvim",
    -- https://github.com/williamboman/mason.nvim#setup
    config = true,
  },

  -- https://github.com/williamboman/mason-lspconfig.nvim#installation
  {
    "williamboman/mason-lspconfig.nvim",
    -- https://github.com/williamboman/mason-lspconfig.nvim#configuration
    opts = {
      ensure_installed = { "lua_ls" },
    },
  },

  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    -- https://github.com/neovim/nvim-lspconfig#suggested-configuration
    config = function()
      -- Setup language servers.
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
    end,
  },
}
