local M = {}
local output_buf = nil

function M.capture_output(cmd)
    -- Create or reuse the output buffer
    if not output_buf or not vim.api.nvim_buf_is_valid(output_buf) then
        output_buf = vim.api.nvim_create_buf(false, true)
    end

    -- Check if buffer is already visible in a window
    local win_found = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == output_buf then
            vim.api.nvim_set_current_win(win)
            win_found = true
            break
        end
    end

    -- If not visible, split at bottom and show the buffer
    if not win_found then
        vim.cmd("belowright split")
        vim.api.nvim_win_set_buf(0, output_buf)
    end

    -- Buffer setup
    vim.api.nvim_buf_set_option(output_buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(output_buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(output_buf, "swapfile", false)
    vim.api.nvim_buf_set_option(output_buf, "modifiable", true)
    vim.api.nvim_buf_set_lines(output_buf, 0, -1, false, {}) -- Clear lines

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
            local line_count = vim.api.nvim_buf_line_count(output_buf)
            vim.api.nvim_buf_set_lines(output_buf, line_count, line_count, false, non_empty)
            vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(output_buf), 0 })
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
            vim.api.nvim_buf_set_option(output_buf, "modifiable", false)
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
