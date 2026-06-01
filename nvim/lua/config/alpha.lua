local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    [[                                                                     ]],
    [[       ███████████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      ████████████████ ███████████ ███   ███████     ]],
    [[     ████████████████ ████████████ █████ ██████████████   ]],
    [[    █████████████████████████████ █████ █████ ████ █████   ]],
    [[  ██████████████████████████████████ █████ █████ ████ █████  ]],
    [[ ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
    [[ ██████   ██  ███████████████   ██ █████████████████ ]],
    [[ ██████   ██  ███████████████   ██ █████████████████ ]],
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
    dashboard.button("<leader>v", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
    dashboard.button("<leader>ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
    dashboard.button("<leader>fr", "  > Recent files", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("<leader>fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    dashboard.button("<leader>up", "  > Update", "<cmd>lua vim.pack.update()<CR>"),
}

dashboard.config.layout = {
  { type = "padding", val = 10 },
  dashboard.section.header,
  { type = "padding", val = 10 },
  dashboard.section.buttons,
}

-- Send config to alpha
alpha.setup(dashboard.opts)
