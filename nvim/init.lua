-- For auto cmp
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

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
vim.cmd("syntax on")

-- Vertical mark
vim.opt.colorcolumn = "80,100"

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undo') -- Set undo directory

-- keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bp", vim.cmd.bprev)
vim.keymap.set("n", "<leader>bk",
    function()
        if vim.bo.buftype == "terminal" then
            vim.cmd("bwipeout!") -- force close terminal buffer
        else
            vim.cmd("bwipeout") -- normal close for regular buffers
        end
    end,
    { noremap = true, silent = true, desc = "Close buffer (force for terminal)" })

vim.keymap.set("n", "<leader>db", vim.cmd.Alpha)
vim.keymap.set('v', '<Leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ot", require("custom.term").open_terminal_in_root_dir,
    { noremap = true, silent = true, desc = "Open new terminal buffer in file dir" })
vim.keymap.set("n", "<leader>oT", require("custom.term").open_terminal_in_file_dir,
    { noremap = true, silent = true, desc = "Open new terminal buffer in file dir" })

-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', 'GD', vim.lsp.buf.implementation, { desc = 'Go to implementation' })

-- Remap Ctrl+\ Ctrl+n to Ctrl+[ in terminal mode
vim.cmd([[ tnoremap <C-[> <C-\><C-n>]])

-- for lazy
require("config.lazy")

-- colorscheme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- disable highlighting from lsps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- Disable semantic tokens
        client.server_capabilities.semanticTokensProvider = nil
    end,
})

-- Customs
require("custom.cmake").setup()
require("custom.shell").setup()
require("custom.new-file").setup()

-- For transparent background
vim.cmd([[hi! Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi! NormalNC guibg=NONE ctermbg=NONE]])

-- For TODO
vim.cmd [[
  highlight Todo ctermfg=NONE ctermbg=NONE cterm=bold gui=bold guifg=NONE guibg=NONE
]]

-- Highlight for nvim-cmp
-- Deprecated items (gray)
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#928374' }) -- Gruvbox gray

-- Matching text (yellow/orange)
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#fabd2f' })  -- Gruvbox yellow
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpItemAbbrMatch' }) -- Fixed typo in your original

-- Variables, interfaces, text (blue)
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#83a598' }) -- Gruvbox blue
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })

-- Functions/methods (purple)
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#d3869b' }) -- Gruvbox purple
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })

-- Keywords, properties, units (foreground)
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#ebdbb2' }) -- Gruvbox foreground
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

-- Additional Gruvbox-themed highlights
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { bg = 'NONE', fg = '#fabd2f' }) -- Yellow
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { bg = 'NONE', fg = '#8ec07c' }) -- Green
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { bg = 'NONE', fg = '#fe8019' }) -- Orange
