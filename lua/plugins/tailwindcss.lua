return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      local cwd = vim.fn.getcwd()
      local is_monorepo = vim.fn.filereadable(cwd .. "/turbo.json") == 1
        or vim.fn.filereadable(cwd .. "/pnpm-workspace.yaml") == 1
        or vim.fn.filereadable(cwd .. "/bun.lock") == 1

      local experimental = {}

      if is_monorepo then
        local paths = {
          cwd .. "/packages/ui/src/styles/globals.css",
          cwd .. "/packages/ui/styles/globals.css",
          cwd .. "/packages/ui/postcss.config.mjs",
        }

        for _, path in ipairs(paths) do
          if vim.fn.filereadable(path) == 1 then
            experimental.configFile = path
            break
          end
        end
      end

      opts.servers.tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = experimental,
            includeLanguages = {
              typescript = "javascript",
              typescriptreact = "javascript",
            },
            classRegex = {
              { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            },
          },
        },
      }

      return opts
    end,
  },
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = "VeryLazy",
    version = "*",
    keys = {
      -- One handed keymap recommended, you will be using the mouse
      {
        "<leader>v",
        function()
          require("oklch-color-picker").pick_under_cursor()
        end,
        desc = "Color pick under cursor",
      },
    },
    ---@type oklch.Opts
    opts = {},
  },
  {
    "NvChad/nvim-colorizer.lua",
    optional = true,
    opts = {
      user_default_options = {
        names = true,
        tailwind = true,
      },
    },
  },
}
