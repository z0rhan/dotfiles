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

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.cmake.setup({ capabilities = capabilities })
            lspconfig.glsl_analyzer.setup({
                capabilities = capabilities,
                filetypes = { "gdshader" },
            })

            lspconfig.rust_analyzer.setup({ capabilities = capabilities })

            lspconfig.pylsp.setup({ capabilities = capabilities })

            lspconfig.html.setup({
                capabilities = capabilities,
                filetypes = { "html", "htmldjango", "django-html" }
            })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })

            lspconfig.sqlls.setup({ capabilities = capabilities })

            lspconfig.hls.setup({ capabilities = capabilities })
        end,
    },
}
