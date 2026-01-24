return {
	"ldelossa/gh.nvim",
	dependencies = {
		{
			"ldelossa/litee.nvim",
			config = function()
				require("litee.lib").setup()
			end,
		},
	},
	config = function()
		require("litee.gh").setup({
			-- remap the arrow keys to resize any litee.nvim windows.
			map_resize_keys = false,
			-- do not map any keys inside any gh.nvim buffers.
			disable_keymaps = false,
			-- the icon set to use.
			icon_set = "default",
			-- any custom icons to use.
			icon_set_custom = nil,
			-- whether to register the @username and #issue_number omnifunc completion
			-- in buffers which start with .git/
			git_buffer_completion = true,
			-- defines keymaps in gh.nvim buffers.
			keymaps = {
				-- when inside a gh.nvim panel, this key will open a node if it has
				-- any futher functionality.
				open = "<CR>",
				-- when inside a gh.nvim panel, expand a collapsed node
				expand = "zo",
				-- when inside a gh.nvim panel, collapse an expanded node
				collapse = "zc",
				-- when cursor is over a "#1234" formatted issue or PR, open its details
				goto_issue = "gd",
				-- show any details about a node
				details = "d",
				-- inside a convo buffer, submit a comment
				submit_comment = "<C-s>",
				-- inside a convo buffer, open up actions menu
				actions = "<C-a>",
				-- inside a thread convo buffer, resolve the thread.
				resolve_thread = "<C-r>",
				-- open the node's web URL in your browser
				goto_web = "gx",
			},
		})
	end,
}
