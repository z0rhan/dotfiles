print("Hello!")

vim.opt.guicursor = ""

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)
vim.opt.smartindent = false

require("config.lazy")

vim.cmd([[hi! Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi! NormalNC guibg=NONE ctermbg=NONE]])
  -- Add more highlighting groups as needed


