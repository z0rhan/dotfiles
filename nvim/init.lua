-- Plugins
vim.pack.add({
    -- Gruvbox
    "https://github.com/ellisonleao/gruvbox.nvim",

    -- Telescope
    "https://github.com/nvim-telescope/telescope.nvim",
    -- Deps
    "https://github.com/nvim-lua/plenary.nvim",
    -- fzf-native extension for faster search
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",

    -- Vim-tmux-navigator
    "https://github.com/christoomey/vim-tmux-navigator",

    -- Lsp_signature
    "https://github.com/ray-x/lsp_signature.nvim",

     -- LSP
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
      -- CMP / snippets
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/hrsh7th/cmp-nvim-lua",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/onsails/lspkind.nvim",
})

-- config
require("config.options")
require("config.keymaps")
require("config.telescope")
require("config.gruvbox")
require("config.cmp")
require("config.lsp")
require("config.lsp_signature")

-- Packages
vim.cmd("packadd nvim.undotree")

-- For transparent background
vim.cmd([[hi! Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi! NormalNC guibg=NONE ctermbg=NONE]])
