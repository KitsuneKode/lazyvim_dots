local M = {}

M.base46 = {
  theme = "catppuccin", -- choose your theme
  transparency = false,

  integrations = {
    "dap",
    "cmp",
    "telescope",
    "notify",
    "nvimtree",
    "trouble",
  },
}

M.ui = {
  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true, -- Enable Tailwind colors
    },
  },

  telescope = { style = "borderless" },

  statusline = {
    theme = "default",
    separator_style = "default",
  },

  tabufline = {
    enabled = false,
    lazyload = true,
  },
}

M.lsp = {
  signature = true, -- Enable LSP signature help
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M
