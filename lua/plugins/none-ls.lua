-- https://github.com/nvimtools/none-ls.nvim#migration
return {
  "nvimtools/none-ls.nvim",
  -- https://github.com/nvimtools/none-ls.nvim#setup
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
