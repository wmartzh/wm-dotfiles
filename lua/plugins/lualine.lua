return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "tokyonight",
       component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      always_divide_middle = true,
      },
      refresh = {
        statusline = 1500,
        tabline = 1500,
        winbar = 1500,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "lsp_status" },
        lualine_x = {},
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
      },
      extensions = { "neo-tree" }
    },
  },
}
