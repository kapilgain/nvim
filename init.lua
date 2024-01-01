vim.g.mapleader = " "

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", space = "·" }

-- Clipboard
vim.opt.clipboard:append({ "unnamedplus" })

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Key mappings
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>X", "<cmd>:silent !chmod +x %<CR>", { desc = "Make executable" })

-- Plugin management
-- https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
