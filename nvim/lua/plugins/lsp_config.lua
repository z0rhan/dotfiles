return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Define/override configuration for servers via vim.lsp.config
            vim.lsp.config("lua_ls", { capabilities = capabilities })

            vim.lsp.config("clangd", { capabilities = capabilities, })
            vim.lsp.config("cmake", { capabilities = capabilities, })
            vim.lsp.config("glsl_analyzer", {
                capabilities = capabilities,
                filetypes = { "gdshader" },
            })

            vim.lsp.config("rust_analyzer", { capabilities = capabilities, })

            vim.lsp.config("pylsp", { capabilities = capabilities, })

            vim.lsp.config("html", {
                capabilities = capabilities,
                filetypes = { "html", "htmldjango", "django-html" },
            })
            vim.lsp.config("cssls", { capabilities = capabilities, })
            vim.lsp.config("ts_ls", { capabilities = capabilities, })

            vim.lsp.config("sqlls", { capabilities = capabilities, })

            vim.lsp.config("hls", { capabilities = capabilities, })

            vim.lsp.enable({
                "lua_ls",
                "clangd",
                "cmake",
                "glsl_analyzer",
                "rust_analyzer",
                "pylsp",
                "html",
                "cssls",
                "ts_ls",
                "sqlls",
                "hls",
            })
        end,
    },
}
