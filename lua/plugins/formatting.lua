if true then
  return {}
end

return {
  -- Disable Mason installing/running biome via null-ls
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(v)
        return v ~= "biome"
      end, opts.ensure_installed or {})

      -- Completely remove biome from null-ls sources
      opts.handlers = opts.handlers or {}
      opts.handlers.biome = function() end -- Empty handler = disabled
    end,
  },

  -- Ensure nvim-lint biome requires config (already default but reinforce)
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Only use biome when biome.json exists in project
      local has_biome = vim.fs.find({ "biome.json", "biome.jsonc" }, {
        upward = true,
        path = vim.fn.getcwd(),
      })[1]

      if not has_biome then
        -- Remove biome from all formatters, fall back to prettier
        for ft, formatters in pairs(opts.formatters_by_ft or {}) do
          if type(formatters) == "table" then
            opts.formatters_by_ft[ft] = vim.tbl_filter(function(f)
              return f ~= "biome" and f ~= "biome-check"
            end, formatters)
          end
        end
      end
    end,
  },
}
