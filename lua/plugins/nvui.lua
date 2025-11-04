-- if true then
--   return {}
-- end

return {
  { "nvim-lualine/lualine.nvim", enabled = false },
  -- { "akinsho/bufferline.nvim", enabled = false },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvchad/ui",
    lazy = false,
    priority = 999,
    config = function()
      require("nvchad")
    end,
  },

  {
    "nvchad/base46",
    lazy = false,
    priority = 1000,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvzone/volt",
    lazy = true,
  },

  -- Required dependency
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
