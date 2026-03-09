return {
	"saghen/blink.cmp", -- This is the correct repository
	dependencies = { "rafamadriz/friendly-snippets" },
	-- build = "rustup run nightly cargo build --release",
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<M-k>"] = { "show_signature", "hide_signature", "fallback" },
		},
		completion = {
			trigger = {
				show_on_keyword = true,
				show_in_snippet = false,
				-- Debounce to reduce trigger frequency
				debounce_ms = 100,
			},
			list = {
				max_items = 30, -- Reduced for faster rendering
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			menu = {
				draw = {
					-- Simpler columns for faster rendering
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500, -- Increased delay to not block completion
				window = {
					border = "single",
				},
			},
			-- Ghost text can slow things down
			ghost_text = { enabled = false },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- Disable blink.cmp for filetypes handled by CoC
			per_filetype = {
				typescript = {},
				typescriptreact = {},
				javascript = {},
				javascriptreact = {},
				rust = {},
				c = {},
				cpp = {},
			},
			-- Per-source timeout
			providers = {
				buffer = {
					max_items = 3,
					min_keyword_length = 4, -- Increased to reduce buffer scanning
					score_offset = -3, -- Lower priority
				},
				lsp = {
					async = true,
					timeout_ms = 2000, -- Timeout slow LSP responses
					score_offset = 10, -- Higher priority
				},
				path = {
					max_items = 5,
				},
				snippets = {
					max_items = 5,
					score_offset = -1,
				},
			},
		},
		-- Signature help
		signature = {
			enabled = true,
			window = {
				border = "single",
			},
		},
	},
}
