local M = {}

-- Function to create a file and directory if they don't exist
function M.create_file_and_dir(file_path)
    -- Get the directory part of the file path
    local dir = vim.fn.fnamemodify(file_path, ":h")

    -- Check if the directory exists
    if vim.fn.isdirectory(dir) == 0 then
        -- If the directory doesn't exist, create it
        local result = vim.fn.mkdir(dir, "p")
        if result == 0 then
            vim.notify("Failed to create directory: " .. dir, vim.log.levels.ERROR)
            return
        end
    end

    -- Open the file for editing
    vim.cmd("edit " .. file_path)
end

-- Command to use the function easily from Neovim
function M.setup()
    -- Register the CreateFile command
    vim.api.nvim_create_user_command(
        'E',
        function(opts)
            M.create_file_and_dir(opts.args)
        end,
        {
            nargs = 1,
            complete = 'file'
        }
    )
end

return M
