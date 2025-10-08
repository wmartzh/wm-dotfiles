return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      -- signs = { -- Uncomment and modify if you want to customize the icons
      --   add          = { text = '│' },
      --   change       = { text = '│' },
      --   delete       = { text = '_' },
      --   topdelete    = { text = '‾' },
      --   changedelete = { text = '~' },
      --   untracked    = { text = '┆' },
      -- },
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`

      -- On attach function to set keymaps
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Go to next git hunk" })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Go to previous git hunk" })

        -- Actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage git hunk" })
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset git hunk" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview git hunk" })
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Git blame line" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted lines" })
      end,
    })
  end,
}
