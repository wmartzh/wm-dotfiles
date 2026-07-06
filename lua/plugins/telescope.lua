return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"fannheyward/telescope-coc.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					path_display = { "truncate" },
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = { prompt_position = "top" },
					},
					-- Performance settings
					file_ignore_patterns = {
						"node_modules",
						".git/",
						"dist/",
						"build/",
						"target/",
						"%.lock",
					},
					preview = {
						treesitter = false, 
          },
					cache_picker = {
						num_pickers = 5,
					},
					mappings = {
						i = {
							["<Esc>"] = actions.close,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					coc = {
						prefer_locations = true,
						path_display = { "tail" },
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("coc")
		end,
		keys = {
			{ "<leader>ss", "<cmd>Telescope coc document_symbols<cr>", desc = "Document symbols (CoC)" },
			{ "<leader>sS", "<cmd>Telescope coc workspace_symbols<cr>", desc = "Workspace symbols (CoC)" },
			{ "<leader>cod", "<cmd>Telescope coc diagnostics<cr>", desc = "Diagnostics (CoC)" },
			{ "<leader>coo", "<cmd>Telescope coc document_symbols<cr>", desc = "Outline (CoC)" },
			{ "gr", "<cmd>Telescope coc references<cr>", desc = "References (CoC)" },
		},
	},
}
