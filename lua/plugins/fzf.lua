return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    fzf_opts = {
      ["--layout"] = "reverse",
    },
    fzf_colors = { true },
    files = {
      cwd_prompt = false,
      prompt = "󰥩 󰅂 "
    },
    grep = {
      cwd_prompt = false,
      prompt = " 󰅂 "

    }
  },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>",             desc = "Find Files" },
    { "<leader>fr", "<cmd>FzfLua files resume=true<cr>", desc = "Find Files" },

    -- Live Grep
    {
      "<leader>/",
      "<cmd>FzfLua live_grep<cr>",
      desc = "Live Grep",
    },
  },
}
