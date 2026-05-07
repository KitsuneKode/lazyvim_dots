return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      preview_config = {
        -- Change from floating window to inline
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
    keys = {
      -- Map a key specifically for inline diff viewing
      {
        "<leader>ghi",
        function()
          require("gitsigns").preview_hunk_inline()
        end,
        desc = "Preview Hunk Inline",
      },
    },
  },
}
