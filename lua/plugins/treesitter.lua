return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "go",
          "bash",
          "json",
          "markdown",
          "yaml",
          "dot"
        },
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  }
}
