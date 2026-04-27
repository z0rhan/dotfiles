require("gruvbox").setup({
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        folds = true,
    },

    overrides = {
        ["@keyword.conditional.c"] = { italic = true },
        ["@keyword.conditional.cpp"] = { italic = true },
        ["@keyword.conditional.rust"] = { italic = true },

        ["@module.c"] = { italic = true },
        ["@module.cpp"] = { italic = true },
        ["@module.rust"] = { italic = true },

    }
})

vim.cmd[[colorscheme gruvbox]]
