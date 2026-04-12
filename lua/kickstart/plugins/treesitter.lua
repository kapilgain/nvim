-- https://github.com/nvim-treesitter/nvim-treesitter/#adding-parsers
-- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
vim.treesitter.language.register("html", "jinja")

return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    init = function()
      local ensureInstalled = {
        "bash",
        "c",
        "cpp",
        "diff",
        "html",
        "java",
        "lua",
        "luadoc",
        "markdown",
        --https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#syntax-highlighting
        "markdown_inline",
        "python",
        "vim",
        "vimdoc",
      }
      local alreadyInstalled = require("nvim-treesitter.config").get_installed()
      local parsersToInstall = vim
        .iter(ensureInstalled)
        :filter(function(parser)
          return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
      require("nvim-treesitter").install(parsersToInstall)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          -- Enable treesitter highlighting and disable regex syntax
          pcall(vim.treesitter.start)
          -- Enable treesitter-based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
