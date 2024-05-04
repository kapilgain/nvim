-- https://github.com/nvimtools/none-ls.nvim#migration
return {
  "nvimtools/none-ls.nvim",
  -- https://github.com/nvimtools/none-ls.nvim#setup
  dependencies = {
    -- https://github.com/nvimtools/none-ls-extras.nvim?tab=readme-ov-file#lazynvim
    "nvimtools/none-ls-extras.nvim",
  },
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
        -- https://github.com/nvimtools/none-ls-extras.nvim?tab=readme-ov-file#setup
        require("none-ls.diagnostics.ruff"),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        --Typescript
        -- https://github.com/nvimtools/none-ls-extras.nvim?tab=readme-ov-file#setup
        require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.formatting.prettierd,

        -- Yaml
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.yamlfix,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format" })
  end,
}
