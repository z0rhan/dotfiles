-- keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)
vim.keymap.set('v', '<Leader>y', '"+y', { noremap = true, silent = true })
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
--vim.keymap.set("n", "<leader>t", require("custom.term").open_terminal_in_root_dir,
--    { noremap = true, silent = true, desc = "Open new terminal buffer in root dir" })
--vim.keymap.set("n", "<leader>vt", require("custom.term").open_terminal_in_root_dir_vertical,
--    { noremap = true, silent = true, desc = "Open new terminal buffer in file dir" })
--vim.keymap.set("n", "<leader>T", require("custom.term").open_terminal_in_file_dir,
--    { noremap = true, silent = true, desc = "Open new terminal buffer in root dir Vertically" })
--vim.keymap.set("n", "<leader>hT", require("custom.term").open_terminal_in_file_dir_vertical,
--    { noremap = true, silent = true, desc = "Open new terminal buffer in file dir Vertically" })

-- Go to definition
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
-- vim.keymap.set('n', 'GD', vim.lsp.buf.implementation, { desc = 'Go to implementation' })

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
-- vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { silent = true })
