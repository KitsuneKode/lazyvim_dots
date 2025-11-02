if true then
  return {}
end
-- lua/plugins/theme-persist.lua
local cache = vim.fs.joinpath(vim.fn.stdpath("state"), "last_colorscheme")

return {
  {
    "LazyVim/LazyVim",
    -- set the theme from cache before LazyVim applies it
    opts = function(_, opts)
      local f = io.open(cache, "r")
      if f then
        local name = f:read("*l")
        f:close()
        if name and #name > 0 then
          opts.colorscheme = name
        end
      end
      opts.colorscheme = opts.colorscheme or "tokyonight" -- fallback
    end,

    -- persist once when leaving, away from the preview/autocmd hot path
    init = function()
      vim.api.nvim_create_autocmd("VimLeavePre", {
        group = vim.api.nvim_create_augroup("PersistColorschemeOnExit", { clear = true }),
        callback = function()
          local name = vim.g.colors_name
          if not name or #name == 0 then
            return
          end
          local f = io.open(cache, "w+")
          if not f then
            return
          end
          f:write(name .. "\n")
          f:close()
        end,
      })

      -- optional: persist immediately without exiting
      vim.api.nvim_create_user_command("ThemePersist", function()
        local name = vim.g.colors_name
        if not name or #name == 0 then
          vim.notify("No active colorscheme", vim.log.levels.WARN)
          return
        end
        local f = io.open(cache, "w+")
        if not f then
          vim.notify("Cannot write colorscheme cache", vim.log.levels.ERROR)
          return
        end
        f:write(name .. "\n")
        f:close()
        vim.notify("Saved theme '" .. name .. "' for next start")
      end, {})
    end,
  },
}
