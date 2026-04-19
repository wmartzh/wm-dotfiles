return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = {
		formatters_by_ft = {
			["html"] = { "prettierd", stop_after_first = true },
			["javascript"] = { "prettierd", stop_after_first = true },
			["javascriptreact"] = { "prettierd", stop_after_first = true },
			["markdown"] = { "prettierd", stop_after_first = true },
			["typescript"] = { "prettierd", stop_after_first = true },
			["typescriptreact"] = { "prettierd", stop_after_first = true },
			["go"] = { "gofmt", "goimports" },
			["c"] = { "clang_format" },
			["cpp"] = { "clang_format" },
			["*"] = { "trim_whitespace" },
			["lua"] = { "stylua" },
			["rust"] = { "rustfmt" },
			["svelte"] = { "prettierd", stop_after_first = true },
			["vue"] = { "prettierd", stop_after_first = true },
		},
		-- format_on_save disabled - use <leader>f to format manually
	},
}
