require("nvim-treesitter.config").setup({
    ensure_installed = { "c", "cpp", "lua", "vim", "python"},
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype
    local lang = vim.treesitter.language.get_lang(ft)

    if not lang then
      return
    end

    pcall(vim.treesitter.start, bufnr, lang)
  end,
})
