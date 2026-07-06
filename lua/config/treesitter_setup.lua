-- Treesitter runtime configuration
-- Per official docs: https://github.com/nvim-treesitter/nvim-treesitter

local filetypes = {
  'lua', 'c', 'cpp', 'javascript', 'typescript',
  'html', 'go', 'bash', 'json', 'rust',"jsx","tsx",
  'svelte', 'vue', 'markdown', 'yaml', "astro"
}

-- Enable treesitter highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function()
    vim.treesitter.start()
  end,
})

-- Enable treesitter indenting (experimental)
vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function()
    vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
  end,
})
