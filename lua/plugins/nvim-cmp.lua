return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    { "hrsh7th/cmp-emoji" },
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    -- transparent highlight groups
    vim.api.nvim_set_hl(0, "CmpMenuBG", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpFloatBG", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpFloatBorder", { bg = "NONE" })

    -- local format_kinds = opts.formatting.format

    table.insert(opts.sources, { name = "emoji" })

    -- opts.formatting.format = function(entry, item)
    --   format_kinds(entry, item) -- add icons
    --   return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    -- end

    -- apply to completion (PUM) and docs (float) windows
    opts.window = {
      completion = cmp.config.window.bordered({
        -- use Pmenu semantics so pumblend applies
        winhighlight = "Normal:CmpMenuBG,FloatBorder:CmpFloatBorder,CursorLine:PmenuSel,Search:None",
        -- for completion use pumblend (set in options), keep winblend 0
        winblend = 0,
        border = "rounded",
      }),
      documentation = cmp.config.window.bordered({
        -- floats use NormalFloat semantics
        winhighlight = "Normal:CmpFloatBG,FloatBorder:CmpFloatBorder,Search:None",
        winblend = 15, -- transparency for the docs/hover float
        border = "rounded",
      }),
    }

    opts.formatting = opts.formatting or {}

    local format_orig = opts.formatting.format
    opts.formatting.format = function(entry, item)
      -- Apply original formatting first (if exists)
      if format_orig then
        item = format_orig(entry, item)
      end

      -- Add Tailwind color preview
      if entry.source.name == "nvim_lsp" then
        local entryItem = entry:get_completion_item()
        local color = entryItem.documentation

        if color and type(color) == "string" and color:match("^#%x%x%x%x%x%x$") then
          local hl = "hex-" .. color:sub(2)
          if #vim.api.nvim_get_hl(0, { name = hl }) == 0 then
            vim.api.nvim_set_hl(0, hl, { fg = color })
          end
          item.menu = " "
          item.menu_hl_group = hl
        end
      end

      return item
    end
    return opts
  end,
}
