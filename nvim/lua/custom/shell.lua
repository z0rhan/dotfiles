local M = {}

function M.capture_output(cmd)
    vim.cmd("new")
    local buf = vim.api.nvim_get_current_buf()

    -- Setup buffer options
    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf, "swapfile", false)
    vim.api.nvim_buf_set_option(buf, "modifiable", true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {}) -- Clear any pre-filled line

    -- Appends non-empty lines to buffer and scrolls to bottom
    local function append_lines(data)
        if not data then return end
        local non_empty = {}
        for _, line in ipairs(data) do
            if line ~= "" then
                table.insert(non_empty, line)
            end
        end
        if #non_empty > 0 then
            local line_count = vim.api.nvim_buf_line_count(buf)
            vim.api.nvim_buf_set_lines(buf, line_count, line_count, false, non_empty)
            vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 })
        end
    end

    -- Start async job
    vim.fn.jobstart(cmd, {
        stdout_buffered = false,
        stderr_buffered = false,
        on_stdout = function(_, data) append_lines(data) end,
        on_stderr = function(_, data) append_lines(data) end,
        on_exit = function(_, code)
            append_lines({ "", "[Process exited with code " .. code .. "]" })
            vim.api.nvim_buf_set_option(buf, "modifiable", false)
        end,
    })
end

function M.setup()
    vim.api.nvim_create_user_command("R", function(opts)
        M.capture_output(opts.fargs)
    end, {
        nargs = "+",
        complete = "shellcmd",
    })
end

return M
