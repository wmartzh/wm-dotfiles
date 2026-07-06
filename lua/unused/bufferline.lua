return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  enabled = false,
  opts = {
    options = {
      -- Disable mouse clicks to close buffers
      close_command = "bdelete! %d",
      -- Use a simple separator
      separator_style = "thin",
      -- Show LSP diagnostics indicators
      diagnostics = "nvim_lsp",
      -- Add an offset for the file explorer
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "left",
          separator = true
        }
      },
      -- Show buffer numbers
      show_buffer_numbers = true,
      -- Show close icons
      show_close_icon = true,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
              or (e == "warning" and " " or " ")
          s = s .. n .. sym
        end
        return s
      end

    }
  },
}
