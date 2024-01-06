-- https://www.reddit.com/r/neovim/comments/16r1rno/comment/k20jxtf/
-- https://github.com/teratoscincus/nvim/blob/main/after/ftplugin/netrw.lua
local o = vim.opt

o.colorcolumn = nil

-- Line numbers etc in Netrw
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])
