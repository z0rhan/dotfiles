print("Welcome Back, Piece of Shit!!!")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


vim.opt.guicursor = ""

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch= false

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)
vim.keymap.set('v', '<Leader>y', '"+y', { noremap = true, silent = true })
-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', 'gD', vim.lsp.buf.implementation, { desc = 'Go to implementation' })

-- Remap Ctrl+\ Ctrl+n to Ctrl+[ in terminal mode
-- Use tnoremap to map Ctrl+\ Ctrl+n to Ctrl+[ in terminal mode
vim.cmd([[ tnoremap <C-[> <C-\><C-n>]])

require("config.lazy")

-- For transparent background
vim.cmd([[hi! Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi! NormalNC guibg=NONE ctermbg=NONE]])
-- Add more highlighting groups as needed

-- Vertical mark
vim.opt.colorcolumn = "80,100"


-- Highlight for nvim-cmp
-- Enable persistent undo
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undo')  -- Set undo directory
vim.opt.undofile = true  -- Enable undo file support

-- Deprecated items (gray)
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#928374' }) -- Gruvbox gray

-- Matching text (yellow/orange)
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#fabd2f' }) -- Gruvbox yellow
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpItemAbbrMatch' }) -- Fixed typo in your original

-- Variables, interfaces, text (blue)
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#83a598' }) -- Gruvbox blue
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })

-- Functions/methods (purple)
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#d3869b' }) -- Gruvbox purple
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })

-- Keywords, properties, units (foreground)
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#ebdbb2' }) -- Gruvbox foreground
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

-- Additional Gruvbox-themed highlights
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { bg='NONE', fg='#fabd2f' }) -- Yellow
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { bg='NONE', fg='#8ec07c' }) -- Green
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { bg='NONE', fg='#fe8019' }) -- Orange
