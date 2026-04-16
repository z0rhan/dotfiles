require("mason").setup()

require("mason-lspconfig").setup({
    auto_install = false, -- keep your preference
})

-- Your server configs (Neovim-native)
vim.lsp.config("lua_ls", { capabilities = capabilities })

vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.config("cmake", { capabilities = capabilities })

vim.lsp.config("glsl_analyzer", {
    capabilities = capabilities,
    filetypes = { "gdshader" },
})

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            rustfmt = {
                overrideCommand = { "/home/z0rhan/.cargo/bin/rustfmt" },
            },
        },
    },
})

vim.lsp.config("asm_lsp", { capabilities = capabilities })
vim.lsp.config("pylsp", { capabilities = capabilities })

vim.lsp.config("html", {
    capabilities = capabilities,
    filetypes = { "html", "htmldjango", "django-html" },
})
vim.lsp.config("cssls", { capabilities = capabilities })
vim.lsp.config("ts_ls", { capabilities = capabilities })

vim.lsp.config("sqlls", { capabilities = capabilities })
vim.lsp.config("hls", { capabilities = capabilities })
vim.lsp.config("tinymist", { capabilities = capabilities })

vim.lsp.enable({
    "lua_ls",
    "clangd",
    "cmake",
    "glsl_analyzer",
    "rust_analyzer",
    "asm_lsp",
    "pylsp",
    "html",
    "cssls",
    "ts_ls",
    "sqlls",
    "hls",
    "tinymist",
})

vim.keymap.set("n", "<leader>sh", function()
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, { desc = "Toggle Inlay Hints" })
