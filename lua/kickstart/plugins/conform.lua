return {
  { -- Autoformat
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 5000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        -- Conform can also run multiple formatters sequentially
        go = { "gofumpt", "goimports-reviser", "golines" },
        java = { "google-java-format" },
        javascript = { "prettierd", "eslint_d" },
        jinja = { "djlint" },
        json = { "prettierd", "eslint_d" },
        html = { "prettierd" },
        lua = { "stylua" },
        python = { "ruff", "isort", "black" },
        yaml = { "yamlfix", "yamllint" },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
