return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }

      }
    }
  },
  config = function()
    local capabilitiesOpts = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
        }
      }
    }
    local capabilities = require('blink.cmp').get_lsp_capabilities(capabilitiesOpts)

    local on_attach = function(_, bufnr)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
        buffer = bufnr,
        desc = "Go to definition",
      })
      vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {
        buffer = bufnr,
        desc = "Go to type definition",
      })
      vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<cr>", {
        buffer = bufnr,
        desc = "Go to references (FZF)",
      })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
        buffer = bufnr,
        desc = "Go to implementation",
      })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
        buffer = bufnr,
        desc = "Rename symbol",
      })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
        buffer = bufnr,
        desc = "See code actions",
      })
    end

    local default_config = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    local lua_ls = require("config.lsp_servers.lua_ls")
    -- local ts_ls = require("config.lsp_servers.ts_ls")
    -- config lua server
    vim.lsp.config('lua_ls', vim.tbl_deep_extend('force', default_config, lua_ls))

    vim.lsp.config('deno', {
      settings = {
        deno = {
          enable = true,
          lint = true,
        },
      },
      root_markers = { { "deno.json", "deno.jsonc" } },

    })

    vim.lsp.config('gopls', default_config)


    vim.lsp.enable({
      'lua_ls',
      'gopls',
      -- 'denols'
    })
  end
}
