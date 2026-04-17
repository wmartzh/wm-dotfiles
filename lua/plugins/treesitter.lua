return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
			if not status_ok then
				vim.notify("Failed to load nvim-treesitter", vim.log.levels.ERROR)
				return
			end

			treesitter.setup({
				ensure_installed = {
					"lua",
					"c",
					"cpp",
					"javascript",
					"typescript",
					"html",
					"go",
					"bash",
					"json",
					"markdown",
					"markdown_inline",
					"yaml",
					"dot",
					"rust"
				},
				sync_install = false, -- Async install for better UX
				auto_install = true,
				highlight = {
					enable = true,
					-- Disable for large files and problematic buffers
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100KB
						local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
					-- Disable for large files
					disable = function(_, buf)
						local max_filesize = 100 * 1024
						local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
			})
		end,
	},
}
