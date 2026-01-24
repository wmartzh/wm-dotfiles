return {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders=true",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" }
		local root = vim.fs.root(bufnr, markers)
		-- Fallback to file's directory if no markers found
		on_dir(root or vim.fs.dirname(fname))
	end,
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
	},
}
