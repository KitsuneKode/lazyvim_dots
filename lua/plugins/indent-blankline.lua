return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPre",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      --   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      --   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      --   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      --   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      --   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      -- end)
      --
      -- vim.g.rainbow_delimiters = { highlight = highlight }
      -- require("ibl").setup({ scope = { highlight = highlight } })
      --
      -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    config = function()
      -- Dimmed/subtle colors for inactive indent lines
      local indent_highlight = {
        "IndentDim1",
        "IndentDim2",
        "IndentDim3",
        "IndentDim4",
        "IndentDim5",
        "IndentDim6",
        "IndentDim7",
      }

      -- Bright colors for current scope
      local scope_highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")

      -- Create dimmed highlight groups (30% opacity)
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- Dimmed colors for all indent lines
        vim.api.nvim_set_hl(0, "IndentDim1", { fg = "#4A3644" })
        vim.api.nvim_set_hl(0, "IndentDim2", { fg = "#4A4434" })
        vim.api.nvim_set_hl(0, "IndentDim3", { fg = "#2B3D4A" })
        vim.api.nvim_set_hl(0, "IndentDim4", { fg = "#4A3D30" })
        vim.api.nvim_set_hl(0, "IndentDim5", { fg = "#384A36" })
        vim.api.nvim_set_hl(0, "IndentDim6", { fg = "#45344A" })
        vim.api.nvim_set_hl(0, "IndentDim7", { fg = "#2A4A46" })

        -- Bright colors for current scope
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = scope_highlight }

      require("ibl").setup({
        indent = {
          highlight = indent_highlight, -- Dim colors for all lines
          char = "│",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,

          show_exact_scope = true,
          highlight = scope_highlight, -- Bright colors for current scope
        },
      })

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
