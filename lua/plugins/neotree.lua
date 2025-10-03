return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
	     {
        "<leader>e",
        function()
          vim.cmd.Neotree "toggle"
        end,
        desc = "Explorer NeoTree"
      },
    },
     opts = {
      window = {
        statusline = "",
      }
    },
  }
}
