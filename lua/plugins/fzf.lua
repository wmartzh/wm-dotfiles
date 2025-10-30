return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-mini/mini.nvim",
	},
	opts = {
		glyph_icons = true,
		file_icons = true,
		fzf_opts = {
			["--layout"] = "default",
		},
		fzf_colors = { true },
		files = {
			cwd_prompt = false,
			prompt = "󰥩 󰅂 ",
		},
		grep = {
			cwd_prompt = false,
			prompt = " 󰅂 ",
		},
		buffers = {
			prompt = "Buffers 󰅂 ",
			file_icons = true,
			glyph_icons = true,
			glyph_map = {
				["%"] = " ", -- current
				["#"] = " ", -- alternate
				["a"] = " ", -- active
				["h"] = " ", -- hidden
				["*"] = "●", -- modified
				["="] = "", -- readonly
				["-"] = " ", -- unloaded
				["t"] = " ", -- terminal
			},
		},
		winopts = {
			preview = {
				layout = "flex",
			},
		},
	},
	-- keys = {
	-- 	{
	-- 		"<leader>ff",
	-- 		function()
	-- 			require("fzf-lua").files({ layout = "reverse" })
	-- 		end,
	-- 		desc = "Find Files",
	-- 	},
	-- 	{
	-- 		"<leader>fF",
	-- 		function()
	-- 			require("fzf-lua").files({ resume = true })
	-- 		end,
	-- 		desc = "Find Files Resume",
	-- 	},
	-- 	{
	-- 		"gr",
	-- 		function()
	-- 			require("fzf-lua").lsp_references()
	-- 		end,
	-- 		desc = "Show LSP references",
	-- 	},
	-- 	{
	-- 		"<leader>fd",
	-- 		function()
	-- 			require("fzf-lua").lsp_declarations()
	-- 		end,
	-- 		desc = "Show LSP declarations",
	-- 	},
	-- 	{
	-- 		"gt",
	-- 		function()
	-- 			require("fzf-lua").lsp_typedefs()
	-- 		end,
	-- 		desc = "Show LSP type definitions",
	-- 	},
	-- 	{
	-- 		"<leader>fa",
	-- 		function()
	-- 			require("fzf-lua").lsp_document_symbols()
	-- 		end,
	-- 		desc = "Show LSP Document Symbols",
	-- 	},
	-- 	{
	-- 		"<leader>fg",
	-- 		function()
	-- 			require("fzf-lua").git_status()
	-- 		end,
	-- 		desc = "Git Status",
	-- 	},
	-- 	-- {
	-- 	-- 	"<leader>fb",
	-- 	-- 	function()
	-- 	-- 		require("fzf-lua").buffers()
	-- 	-- 	end,
	-- 	-- 	desc = "Show current buffers",
	-- 	-- },
	-- 	{
	-- 		"<leader>/",
	-- 		function()
	-- 			require("fzf-lua").live_grep()
	-- 		end,
	-- 		desc = "Live Grep",
	-- 	},
	-- },
}
