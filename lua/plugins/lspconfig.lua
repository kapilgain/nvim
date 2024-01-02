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
    config = true,
  },

  -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim#installation
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim#configuration
    opts = {
      ensure_installed = {
        -- Lua
        "lua_ls",
        "stylua",

        -- Python
        "black",
        "isort",
        "mypy",
        "pyright",
        "ruff",
      },
    },
  },

  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    -- https://github.com/neovim/nvim-lspconfig#suggested-configuration
    config = function()
      -- Setup language servers.
      local lspconfig = require("lspconfig")

      -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set location list" })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Implementation" })

          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })

          vim.keymap.set(
            "n",
            "<leader>wa",
            vim.lsp.buf.add_workspace_folder,
            { buffer = ev.buf, desc = "Add workspace folder" }
          )

          vim.keymap.set(
            "n",
            "<leader>wr",
            vim.lsp.buf.remove_workspace_folder,
            { buffer = ev.buf, desc = "Remove workspace folder" }
          )

          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { buffer = ev.buf, desc = "List workspace folders" })

          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type definition" })
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Declaration" })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "References" })
          vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { buffer = ev.buf, desc = "Format" })
        end,
      })
    end,
  },
}
