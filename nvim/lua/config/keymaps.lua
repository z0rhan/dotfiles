-- keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)
vim.keymap.set('v', '<Leader>y', '"+y', { noremap = true })
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

-- Open terminal
vim.keymap.set("n", "<leader>th", require("custom.term").open_terminal_horizontal,
    { noremap = true, silent = true, desc = "Open new terminal buffer in root dir" })
vim.keymap.set("n", "<leader>tv", require("custom.term").open_terminal_vertical,
    { noremap = true, silent = true, desc = "Open new terminal buffer in file dir" })

-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', 'gdi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })

-- Remap Ctrl+\ Ctrl+n to Ctrl+[ in terminal mode
vim.cmd([[ tnoremap <C-[> <C-\><C-n>]])

-- Undotree
vim.keymap.set("n", "<leader>ut", vim.cmd.Undotree, { desc = "Toggle undotree" })

-- Keymaps for Telescope actions
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "Telescope find old files" })
vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Telescope find buffers" })

-- Keymaps for Vim-tmux-navigator
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { silent = true })

-- Oil
vim.keymap.set("n", "<leader>v", '<cmd>Oil<cr>', { desc = "Open oil in preview mode"})
