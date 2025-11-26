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
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      opts.linters.biome = vim.tbl_deep_extend("force", opts.linters.biome or {}, {
        condition = function(utils)
          -- Biome ONLY runs if biome.json/biome.jsonc exists in cwd
          return utils.root_has_file("biome.json") or utils.root_has_file("biome.jsonc")
        end,
      })
    end,
  },
}
