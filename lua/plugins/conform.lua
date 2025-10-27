return {
  'stevearc/conform.nvim',
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      html = { { "prettierd" } },
      javascript = { { "prettierd" } },
      javascriptreact = { { "prettierd" } },
      markdown = { { "prettierd" } },
      typescript = { { "prettierd" } },
      typescriptreact = { { "prettierd" } },
      ["*"] = { "trim_whitespace" },
      lua = { "stylua" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
  },
}
