local M = {}

local function open_terminal(direction)
    local cwd = vim.fn.getcwd()

    if not cwd or cwd == "" then
        vim.notify("No working directory found", vim.log.levels.WARN)
        return
    end

    if direction == "vertical" then
        vim.cmd("belowright vsplit")
    else
        vim.cmd("belowright split")
    end

    vim.cmd("enew")
    vim.fn.termopen(vim.o.shell, { cwd = cwd })
    vim.cmd("startinsert")
end

M.open_terminal_horizontal = function()
    open_terminal("horizontal")
end

M.open_terminal_vertical = function()
    open_terminal("vertical")
end

return M
