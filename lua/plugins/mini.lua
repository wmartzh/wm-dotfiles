return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup({})
			require("mini.icons").setup({})
			require("mini.surround").setup({})
		end,
	},
}
