return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        sources = {
          files = {
            hidden = true,
          },
          explorer = {
            layout = {
              layout = {
                width = 28,
              },
            },
          },
        },
      },
      image = {
        enabled = true,
        convert = { magick = { vector = { "-density", 192, "{src}[0]" } } },
      },
    },
  },
  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Restore Session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore Last Session",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "Don't Save Current Session",
      },
    },
    init = function()
      -- Only restore session if nvim was started with no arguments
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
        callback = function()
          -- Check if any arguments were passed
          if vim.fn.argc() == 0 then
            require("persistence").load()
          end
        end,
        nested = true,
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {

    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Leader>ba", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer from tabline" }, -- Interactive selection with mouse/letters
      -- Add more up to <Leader>9 if needed
    },
    opts = {
      -- Your existing opts here, or leave empty to keep defaults
    },
  },
  -- {
  --   "rmagatti/auto-session",
  --   lazy = false,
  --
  --   ---enables autocomplete for opts
  --   ---@module "auto-session"
  --   ---@type AutoSession.Config
  --   opts = {
  --     suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --     -- log_level = 'debug',
  --   },
  -- },
  { "andweeb/presence.nvim", lazy = false },
  { "wakatime/vim-wakatime", lazy = false },
  { "mg979/vim-visual-multi" },

  {
    "windwp/nvim-ts-autotag",
    opts = {
      opts = { -- Defaults
        enable_close = true, -- Auto close tags

        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </,
      },
    },
    -- event = { "BufReadPre", "BufNewFile" },
  },
}
