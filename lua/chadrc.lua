local M = {}

local transparency = false

M.base46 = {
  theme = "tokyonight", -- choose your theme
  transparency = transparency,

  -- hl_override = vim.tbl_extend("force", {
  --   Visual = {
  --     bg = "#2e3c42",
  --     fg = "NONE",
  --   },
  --   VisualNOS = {
  --     bg = "#2e3c42",
  --     fg = "NONE",
  --   },
  --
  --   -- Search highlight
  --   Search = {
  --     bg = "#1f2a2e",
  --     fg = "NONE",
  --   },
  --   CurSearch = {
  --     bg = "#33464d",
  --     fg = "NONE",
  --   },
  --   IncSearch = {
  --     bg = "#33464d",
  --     fg = "NONE",
  --   },
  -- }, transparency and {
  --   BufferLineFill = { bg = "NONE" },
  --   BufferLineBackground = { bg = "NONE" },
  --   WinBar = { bg = "NONE" },
  --   WinBarNC = { bg = "NONE" },
  -- } or {}),

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
  signature = false, -- Enable LSP signature help
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M
