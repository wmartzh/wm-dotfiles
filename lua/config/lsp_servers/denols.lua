return {
  settings = {
    deno = {
      enable = true,
      lint = true,
    },
  },
  root_markers = { { "deno.json", "deno.jsonc" } },
  root_dir = function()
    -- Check for deno.json or deno.jsonc in the project root
    local node_config = vim.fs.find({ "package.json", "package-lock.json" }, {
      upward = true,
      stop = vim.fn.expand("~"),
    })
    -- Disable if a Deno config is found
    return not next(node_config)
  end,
}
