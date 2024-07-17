-- https://github.com/VonHeikemen/lsp-zero.nvim#installing
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/lazy-loading-with-lazy-nvim.md
return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim#installation
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim#configuration
    lazy = false,
    opts = {
      ensure_installed = {
        -- C#
        -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2574#issuecomment-1757317407
        { "omnisharp", version = "v1.39.8" },

        -- Go
        "delve",
        "goimports-reviser",
        "gofumpt",
        "golines",
        "gopls",

        -- Java
        "checkstyle",
        "google-java-format",
        "jdtls",

        -- Lua
        "lua_ls",
        "stylua",

        -- Python
        "black",
        "debugpy",
        "isort",
        "mypy",
        "pyright",
        "ruff",

        -- Typescript
        "eslint_d",
        "prettierd",
        "tsserver",

        -- Yaml
        "yamlfix",
        "yamllint",
        "yamlls",
      },
    },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
          -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md#use-enter-to-confirm-completion
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp
      { "Hoffs/omnisharp-extended-lsp.nvim" },
    },
    -- https://github.com/VonHeikemen/lsp-zero.nvim#usage
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        -- https://github.com/VonHeikemen/lsp-zero.nvim#keybindings
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      end)

      -- https://github.com/VonHeikemen/lsp-zero.nvim?tab=readme-ov-file#automatic-setup-of-language-servers
      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          -- https://www.youtube.com/watch?v=i04sSQjd-qo
          gopls = function()
            require("lspconfig").gopls.setup({
              settings = {
                gopls = {
                  -- usePlaceholders = true,
                  analyses = {
                    unusedparams = true,
                  },
                },
              },
            })
          end,
          -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/setup-with-nvim-jdtls.md
          jdtls = lsp_zero.noop,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
          end,
          -- https://spaceandtim.es/code/nvim_unity_setup/
          omnisharp = function()
            require("lspconfig").omnisharp.setup({
              handlers = {
                -- https://github.com/Hoffs/omnisharp-extended-lsp.nvim?tab=readme-ov-file#omnisharp-settings
                ["textDocument/definition"] = require("omnisharp_extended").handler,
              },
            })
          end,
        },
      })
    end,
  },
}
