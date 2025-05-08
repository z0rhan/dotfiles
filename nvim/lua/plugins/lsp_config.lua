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
        version = "v1.32.0",
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
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                },
                init_options = {
                    fallbackFlags = {
                        "-std=c++17",
                        "-I/opt/Qt/6.9.0/gcc_64/include",
                        "-I/opt/Qt/6.9.0/gcc_64/include/QtCore",
                        "-I/opt/Qt/6.9.0/gcc_64/include/QtWidgets",
                        "-I/opt/Qt/6.9.0/gcc_64/include/QtGui",
                    },
                },
            })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.djlsp.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.eslint.setup({ capabilities = capabilities })
            lspconfig.cmake.setup({ capabilities = capabilities })
        end,
    },
}
