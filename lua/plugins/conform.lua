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
			["go"] = { "goimports" },
			["c"] = { "clang_format" },
			["cpp"] = { "clang_format" },
			["*"] = { "trim_whitespace" },
			["lua"] = { "stylua" },
			["rust"] = { "rustfmt" },
		},
		format_on_save = function(bufnr)
			-- Disable format_on_save for large files
			local lines = vim.api.nvim_buf_line_count(bufnr)
			if lines > 5000 then
				return nil
			end
			return {
				timeout_ms = 1000,
				lsp_format = "fallback",
			}
		end,
	},
}
