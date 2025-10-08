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
    { "<leader>ff", "<cmd>FzfLua files layout=reverse<cr>", desc = "Find Files" },
    { "<leader>fF", "<cmd>FzfLua files resume=true<cr>",    desc = "Find Files Resume" },
    { "<leader>fr", "<cmd>FzfLua lsp_references<cr>",       desc = "Find Files Resume" },


    -- Live Grep
    {
      "<leader>/",
      "<cmd>FzfLua live_grep<cr>",
      desc = "Live Grep",
    },
  },
}
