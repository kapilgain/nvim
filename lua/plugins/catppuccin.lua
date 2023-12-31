-- https://github.com/catppuccin/nvim#usage
return { 
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- https://github.com/catppuccin/nvim#usage
    vim.cmd.colorscheme "catppuccin"
  end,
}
