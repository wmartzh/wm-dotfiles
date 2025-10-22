return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        component_separators = '',
        section_separators = '',
        always_divide_middle = true,
      },
      refresh = {
        statusline = 1500,
        tabline = 1500,
        winbar = 1500,
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          {
            function()
              local icon = " "
              local folder_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              return icon .. folder_name
            end,
          },
          "lsp_status",
          {
            "filename",
            path = 0,
            symbols = {
              modified = '  ', -- Text to show when the file is modified.
              readonly = '󰷋 ', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = ' ', -- Text to show for newly created file before first write
            }
          },
        },
        lualine_c = {},
        lualine_x = {
          "filetype",
          {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' }
          },

        },
        lualine_y = {
          {
            "progress",
            separator = " ",
            padding = { left = 1, right = 0 }
          },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
      },
      extensions = { "neo-tree", "fzf" }
    },
  },
}
