require("mason").setup()

require("mason-lspconfig").setup({
    auto_install = false, -- keep your preference
    ensure_installed = {
        "rust_analyzer",
        "pylsp"
    }
})

-- vim.lsp.config("lua_ls", { capabilities = capabilities })
-- 
-- vim.lsp.config("clangd", { capabilities = capabilities })
-- vim.lsp.config("cmake", { capabilities = capabilities })

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

vim.lsp.config("pylsp", { capabilities = capabilities })

vim.lsp.enable({
    "rust_analyzer",
    "pylsp",
    -- "lua_ls",
    -- "clangd",
    -- "cmake",
})

vim.keymap.set("n", "<leader>sh", function()
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, { desc = "Toggle Inlay Hints" })

vim.keymap.set("n", "<leader>fd", function()
    vim.lsp.buf.format( {async = true })
end, {desc = "Format document"})
