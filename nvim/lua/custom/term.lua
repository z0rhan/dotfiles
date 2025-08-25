local M = {}

local function open_terminal(cwd)
    if not cwd or cwd == "" then
        vim.notify("No directory found", vim.log.levels.WARN)
        return
    end
    -- Open a new empty split buffer
    vim.cmd("belowright split")
    -- Create a new empty buffer
    vim.cmd("enew")
    -- Now start the terminal in this empty buffer
    vim.fn.termopen(vim.o.shell, { cwd = cwd })
    -- Switch to terminal mode
    vim.cmd("startinsert")
end

M.open_terminal_in_file_dir = function()
    open_terminal(vim.fn.expand("%:p:h"))
end

M.open_terminal_in_root_dir = function()
    open_terminal(vim.fn.getcwd())
end

return M
