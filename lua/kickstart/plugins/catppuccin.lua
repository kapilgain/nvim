-- https://github.com/catppuccin/nvim#usage
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  init = function()
    -- https://github.com/catppuccin/nvim#usage
    vim.cmd.colorscheme("catppuccin")

    -- You can configure highlights by doing something like:
    vim.cmd.hi("Comment gui=none")
  end,
}
-- vim: ts=2 sts=2 sw=2 et
