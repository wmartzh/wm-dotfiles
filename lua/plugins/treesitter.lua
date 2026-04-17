return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        vim.notify("Failed to load nvim-treesitter", vim.log.levels.ERROR)
        return
      end

      treesitter.setup({
        ensure_installed = {
          "lua",
          "c",
          "cpp",
          "javascript",
          "typescript",
          "html",
          "go",
          "bash",
          "json",
          "markdown",
          "markdown_inline",
          "yaml",
          "dot",
          "rust"
        },
        sync_install = false, -- Async install for better UX
        auto_install = true,
        indent = {
          enable = true
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "markdown" },
        }
      })
    end
  },
}
