pcall(require("telescope").load_extension, "fzf")

-- Telescope setup with theme and layout configuration
require("telescope").setup({
    defaults = {
        -- Set your desired theme here
        theme = "ivy", -- You can use 'ivy', 'dropdown', 'cursor', or any custom theme
    },
    pickers = {
        -- Optionally, set specific configurations for different pickers
        live_grep = {
            theme = "ivy", -- Set a theme for live_grep picker specifically
        },
        find_files = {
            -- hidden = "true",
            -- no_ignore = "true",
            theme = "ivy", -- Set a dropdown theme for find_files
        },
        git_files = {
            theme = "ivy", -- Set ivy theme for git_files picker
        },
        oldfiles = {
            theme = "ivy", -- Set ivy theme for git_files picker
        },
        buffres = {
            theme = "ivy", -- Set ivy theme for git_files picker
        },
    },
})
