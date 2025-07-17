local M = {}

function M.run()
    local output = vim.fn.systemlist("cmake -S. -Bbuild 2>&1")

    vim.cmd("new")
    local buf = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf, "swapfile", false)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
end

function M.build()
    local output = vim.fn.systemlist("cmake --build build 2>&1")

    vim.cmd("new")
    local buf = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf, "swapfile", false)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
end

function M.setup()
  vim.api.nvim_create_user_command("Cmake", M.run, {})
  vim.api.nvim_create_user_command("Cmakebuild", M.build, {})
end

return M
