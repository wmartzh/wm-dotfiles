return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = true, -- Lazy load on keymap
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree reveal toggle float<cr>",
        desc = "Explorer NeoTree"
      },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,

    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      default_position = "float",
      window = {
        statusline = "",
        float = {
          win_options = {
            winblend = 50,
            cursorline = true,
          }
        },
      },
      filesystem = {
        hijack_netrw_behavior = "disabled", -- Disabled to prevent E325 swap file errors
      },
      components = {
        header = {
          {
            component = "text",
            text = " ", -- An icon, requires a Nerd Font
            style = "Directory"
          },
          {
            component = "source_name", -- Renders the name "Project"
            style = "bold"
          },
          {
            component = "git_status",
            align = "right" -- Aligns this component to the far right
          }
        }
      },
    },
  }
}
