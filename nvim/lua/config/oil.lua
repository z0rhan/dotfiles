require("oil").setup({
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },

    delete_to_trash = true,

    keymaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split"
    },

    view_options = {
        show_hidden = true,
    },
})
