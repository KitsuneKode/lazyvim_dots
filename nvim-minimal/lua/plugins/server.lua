local disabled = {
  "akinsho/bufferline.nvim",
  "catppuccin/nvim",
  "folke/flash.nvim",
  "folke/lazydev.nvim",
  "folke/noice.nvim",
  "folke/persistence.nvim",
  "folke/todo-comments.nvim",
  "folke/tokyonight.nvim",
  "folke/trouble.nvim",
  "MagicDuck/grug-far.nvim",
  "mason-org/mason-lspconfig.nvim",
  "mason-org/mason.nvim",
  "mfussenegger/nvim-lint",
  "MunifTanjim/nui.nvim",
  "neovim/nvim-lspconfig",
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "rafamadriz/friendly-snippets",
  "saghen/blink.cmp",
  "stevearc/conform.nvim",
  "windwp/nvim-ts-autotag",
}

local specs = {}

for _, plugin in ipairs(disabled) do
  specs[#specs + 1] = { plugin, enabled = false }
end

vim.list_extend(specs, {
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      image = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        options = {
          globalstatus = false,
          icons_enabled = false,
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {},
      }
    end,
  },
  {
    "nvim-mini/mini.ai",
    enabled = false,
  },
  {
    "folke/ts-comments.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false,
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "^" },
        changedelete = { text = "~" },
        untracked = { text = "+" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "^" },
        changedelete = { text = "~" },
      },
    },
  },
})

return specs
