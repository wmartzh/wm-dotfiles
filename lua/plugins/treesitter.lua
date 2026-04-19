-- Treesitter plugin installation
-- Runtime config in lua/config/treesitter_setup.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Install parsers (async)
      local langs = {
        "lua", "c", "cpp", "javascript", "typescript",
        "html", "go", "bash", "json", "markdown",
        "markdown_inline", "yaml", "dot", "rust",
        "html_tags",  -- dependency for svelte
        "svelte", "vue"
      }
      require('nvim-treesitter').install(langs)
    end
  },
}
