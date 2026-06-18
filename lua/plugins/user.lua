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
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
        callback = function()
          if vim.fn.argc() == 0 and vim.env.KITTY_SCROLLBACK_NVIM ~= "true" then
            -- 1. Load the session INSTANTLY.
            -- This stops the dashboard from rendering and kills the UI flicker.
            require("persistence").load()

            -- 2. Re-attach LSP after session restore.
            -- Covers both Neovim 0.11 native LSP and legacy lspconfig paths.
            vim.schedule(function()
              -- Ensure lspconfig is loaded
              pcall(require, "lspconfig")

              -- Trigger FileType for all background buffers (New Neovim 0.11 path)
              vim.cmd("silent! doautoall FileType")

              -- Trigger BufReadPost for the actively focused buffer (Legacy path)
              local buf = vim.api.nvim_get_current_buf()
              if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "" then
                vim.api.nvim_exec_autocmds("BufReadPost", { buffer = buf, modeline = false })
              end
            end)
          end
        end,
        nested = true,
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "rafamadriz/friendly-snippets" },
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
  { "tpope/vim-fugitive" },
  {
    "smoka7/multicursors.nvim",
    dependencies = { "nvimtools/hydra.nvim" },
    opts = {},
    keys = {
      { "<C-n>", "<cmd>MCstart<cr>", mode = { "n", "v" } },
    },
  },
  --
  {
    "zbirenbaum/copilot.lua",
    config = function(_, opts)
      require("copilot").setup(opts)
      if vim.env.NVIM_NO_COPILOT then
        require("copilot.command").disable()
      end
    end,
  },

  --
  -- breaks cmp
  -- {
  --   "mg979/vim-visual-multi",
  --
  --   init = function()
  --     vim.g.VM_default_mappings = 0
  --   end,
  -- },
  -- {
  --   "windwp/nvim-ts-autotag",
  --   opts = {
  --     opts = {
  --       -- Defaults
  --       -- enable_close = true, -- Auto close tags
  --       -- enable_rename = true, -- Auto rename pairs of tags
  --       -- enable_close_on_slash = false, -- Auto close on trailing </,
  --     },
  --   },
  --   -- event = { "BufReadPre", "BufNewFile" },
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = { eslint = {} },
  --     setup = {
  --       eslint = function()
  --         require("lazyvim.util").lsp.on_attach(function(client)
  --           if client.name == "eslint" then
  --             client.server_capabilities.documentFormattingProvider = true
  --           elseif client.name == "tsserver" then
  --             client.server_capabilities.documentFormattingProvider = false
  --           end
  --         end)
  --       end,
  --     },
  --   },
  -- },
  --
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
}
