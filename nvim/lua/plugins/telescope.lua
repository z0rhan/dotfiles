return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8", -- You can also use the branch or latest tag here
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for Telescope to work
		"nvim-telescope/telescope-fzf-native.nvim", -- fzf-native extension for faster search
	},
	config = function()
		-- Load the fzf-native extension if fzf is available
		pcall(require("telescope").load_extension, "fzf")

		-- Telescope setup with theme and layout configuration
		require("telescope").setup({
			defaults = {
				-- Set your desired theme here
				theme = "ivy", -- You can use 'ivy', 'dropdown', 'cursor', or any custom theme
			},
			pickers = {
				-- Optionally, set specific configurations for different pickers
				live_grep = {
					theme = "ivy", -- Set a theme for live_grep picker specifically
				},
				find_files = {
					theme = "ivy", -- Set a dropdown theme for find_files
				},
				git_files = {
					theme = "ivy", -- Set ivy theme for git_files picker
				},
				oldfiles = {
					theme = "ivy", -- Set ivy theme for git_files picker
				},
				buffres = {
					theme = "ivy", -- Set ivy theme for git_files picker
				},
			},
		})

		-- Keymaps for Telescope actions
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
		vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "Telescope find old files" })
		vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Telescope find buffers" })
	end,
}
