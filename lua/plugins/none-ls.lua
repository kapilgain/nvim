-- https://github.com/nvimtools/none-ls.nvim#migration
return {
  "nvimtools/none-ls.nvim",
  -- https://github.com/nvimtools/none-ls.nvim#setup
  event = "VeryLazy",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
      sources = {
        -- Java
        null_ls.builtins.diagnostics.checkstyle.with({
          -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#checkstyle
          extra_args = { "-c", "/google_checks.xml" },
        }),
        null_ls.builtins.formatting.google_java_format,

        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Python
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        --Typescript
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,

        -- Yaml
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.yamlfix,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format" })
  end,
}
