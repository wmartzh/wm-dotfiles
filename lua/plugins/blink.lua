return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	-- build = "rustup run nightly cargo build --release",
	version = "1.*",
	enabled = false, -- Disabled by default, CoC is primary
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			-- Tab/Shift-Tab NOT mapped to avoid conflicts with CoC
			-- Use <C-j>/<C-k> for snippet navigation when blink is active
			["<C-j>"] = { "snippet_forward", "fallback" },
			["<C-k>"] = { "snippet_backward", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },

			["<M-b>"] = { "scroll_documentation_up", "fallback" },
			["<M-f>"] = { "scroll_documentation_down", "fallback" },

			["<M-k>"] = { "show_signature", "hide_signature", "fallback" },
		},
		completion = {
			trigger = {
				show_on_keyword = true,
				show_in_snippet = false,
				debounce_ms = 100,
			},
			list = {
				max_items = 30,
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			menu = {
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = {
					border = "single",
				},
			},
			ghost_text = { enabled = false },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		signature = {
			enabled = true,
			window = {
				border = "single",
			},
		},
	},
}
