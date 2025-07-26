local M = {}
local output_buf = nil -- Buffer handle for reuse

-- Capture output
function M.capture_output_async(cmd)
    -- Check if output buffer is valid, otherwise create
    if not output_buf or not vim.api.nvim_buf_is_valid(output_buf) then
        output_buf = vim.api.nvim_create_buf(false, true) -- scratch, unlisted
    end

    -- Try to find a window displaying the output buffer
    local win_found = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == output_buf then
            vim.api.nvim_set_current_win(win)
            win_found = true
            break
        end
    end

    -- If buffer isn't visible, open a split and show it
    if not win_found then
        vim.cmd("belowright split")
        vim.api.nvim_win_set_buf(0, output_buf)
    end

    -- Buffer settings
    vim.api.nvim_buf_set_option(output_buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(output_buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(output_buf, "swapfile", false)
    vim.api.nvim_buf_set_option(output_buf, "modifiable", true)

    -- Clear buffer
    vim.api.nvim_buf_set_lines(output_buf, 0, -1, false, {})

    -- Function to safely append lines
    local function append_lines(lines)
        if not lines or vim.tbl_isempty(lines) then return end

        local filtered = {}
        for _, l in ipairs(lines) do
            if l ~= "" then table.insert(filtered, l) end
        end

        if #filtered == 0 then return end

        local line_count = vim.api.nvim_buf_line_count(output_buf)
        vim.api.nvim_buf_set_lines(output_buf, line_count, line_count, false, filtered)
        vim.api.nvim_win_set_cursor(0, { line_count + #filtered, 0 })
    end

    -- Start async job
    vim.fn.jobstart(cmd, {
        stdout_buffered = false,
        stderr_buffered = false,
        on_stdout = function(_, data, _) append_lines(data) end,
        on_stderr = function(_, data, _) append_lines(data) end,
        on_exit = function(_, code, _)
            append_lines({ "[Process exited with code " .. code .. "]" })
            vim.api.nvim_buf_set_option(output_buf, "modifiable", false)
        end,
    })
end

-- CMake wrappers
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

-- Check if CMakeLists.txt exists
local function has_cmake_project()
    return vim.fn.filereadable("CMakeLists.txt") == 1
end

-- Command registration
function M.setup()
    vim.api.nvim_create_user_command("Cmake", function()
        if not has_cmake_project() then
            vim.notify("No CMakeLists.txt found in current directory", vim.log.levels.ERROR)
            return
        end
        M.run()
    end, {})

    vim.api.nvim_create_user_command("CmakeClean", M.build_clean, {})
    vim.api.nvim_create_user_command("CmakeBuild", M.build, {})
end

return M
