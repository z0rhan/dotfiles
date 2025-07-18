local M = {}

function M.capture_output_async(cmd)
    vim.cmd("new")
    local buf = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf, "swapfile", false)
    vim.api.nvim_buf_set_option(buf, "modifiable", true)

    -- Clear buffer
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})

    -- Append lines to buffer safely
    local function append_lines(lines)
        if not lines or vim.tbl_isempty(lines) then return end

        -- Filter out empty lines (optional)
        local filtered = {}
        for _, l in ipairs(lines) do
            if l ~= "" then table.insert(filtered, l) end
        end

        if #filtered == 0 then return end

        local line_count = vim.api.nvim_buf_line_count(buf)
        vim.api.nvim_buf_set_lines(buf, line_count, line_count, false, filtered)

        -- Move cursor to bottom
        vim.api.nvim_win_set_cursor(0, { line_count + #filtered, 0 })
    end

    -- Start the job
    local job_id = vim.fn.jobstart(cmd, {
        stdout_buffered = false,
        stderr_buffered = false,
        on_stdout = function(_, data, _)
            append_lines(data)
        end,
        on_stderr = function(_, data, _)
            append_lines(data)
        end,
        on_exit = function(_, code, _)
            append_lines({ "[Process exited with code " .. code .. "]" })
            vim.api.nvim_buf_set_option(buf, "modifiable", false)
        end,
    })
end

function M.run()
    M.capture_output_async("cmake -S. -Bbuild")
end

function M.build()
    M.capture_output_async("cmake --build build")
end

function M.build_clean()
    vim.fn.systemlist("rm -rf ./build")
    M.run()
end

function M.setup()
    vim.api.nvim_create_user_command("Cmake", M.run, {})
    vim.api.nvim_create_user_command("CmakeBuild", M.build, {})
    vim.api.nvim_create_user_command("CmakeBuildClean", M.build_clean, {})
end

return M
