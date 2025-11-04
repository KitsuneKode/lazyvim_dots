-- if true then
--   return {}
-- end

return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      -- Enable theme
      -- require("onedark").load()
    end,
  },

  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      -- transparent_background = true,
      float = {
        -- transparent = true,
        -- solid = true,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        opts.highlights = require("catppuccin.special.bufferline").get_theme()
      end
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparent_background = true,
        sidebars = "transparent",
        transparency = true,
        floats = "transparent",
      },
    },
  },

  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      -- transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Do NOT call vim.cmd.colorscheme here
    -- Keep options only; LazyVim will pick which theme to apply
    opts = { transparent = true },
    config = function(_, opts)
      vim.g.oxocarbon_lua = 1
      vim.g.transparent_enabled = opts.transparent and 1 or 0
      -- no colorscheme call here
    end,
  },
}
