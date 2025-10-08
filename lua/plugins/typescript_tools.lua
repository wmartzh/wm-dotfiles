return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  cond = function()
    -- Check for deno.json or deno.jsonc in the project root
    local deno_config = vim.fs.find({ "deno.json", "deno.jsonc" }, {
      upward = true,
      stop = vim.fn.expand("~"),
    })
    -- Disable if a Deno config is found
    return not next(deno_config)
  end,
  opts = {

    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all'
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    }
  },
}
