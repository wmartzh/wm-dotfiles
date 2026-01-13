return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 300, -- Show after 300ms
    triggers = {
      { "<auto>", mode = "nxso" }, -- Auto triggers for all modes
    },
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = false },
    },
    win = {
      border = "single",
      padding = { 1, 2 },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    -- Register key groups
    wk.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Hunk" },
      { "<leader>s", group = "Symbols" },
    })
  end,
}
