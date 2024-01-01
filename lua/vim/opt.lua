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
