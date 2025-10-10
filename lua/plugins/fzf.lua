return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    fzf_opts = {
      ["--layout"] = "default",
    },
    fzf_colors = { true },
    files = {
      cwd_prompt = false,
      prompt = "󰥩 󰅂 "
    },
    grep = {
      cwd_prompt = false,
      prompt = " 󰅂 "
    },
    winopts = {
      preview = {
        layout = "flex"
      }
    }
  },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files layout=reverse<cr>", desc = "Find Files" },
    { "<leader>fF", "<cmd>FzfLua files resume=true<cr>",    desc = "Find Files Resume" },
    { "<leader>fr", "<cmd>FzfLua lsp_references<cr>",       desc = "Show LSP references" },
    { "<leader>fd", "<cmd>FzfLua lsp_declarations<cr>",     desc = "Show LSP declarations" },
    { "<leader>ft", "<cmd>FzfLua lsp_typedefs<cr>",         desc = "Show LSP type definitions" },
    { "<leader>fg", "<cmd>FzfLua git_status<cr>",           desc = "Git Status" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>",              desc = "Show current buffers" },

    -- Live Grep
    {
      "<leader>/",
      "<cmd>FzfLua live_grep<cr>",
      desc = "Live Grep",
    },
  },
}
