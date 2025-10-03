return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    opts = {
      sync_install = false,
      auto_install = true,
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
      highligth = {
        syntax = true
      }

    }
  }
}
