-- Mapleader
vim.g.mapleader = " "

-- vim options
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.scrolloff = 10
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = false

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
-- vim.cmd("syntax off")

-- Vertical mark
vim.opt.colorcolumn = "80,100"

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undo') -- Set undo directory
