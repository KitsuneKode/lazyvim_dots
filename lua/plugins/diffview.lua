return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
      "DiffviewRefresh",
    },
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gdO", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Diffview Origin → HEAD" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview File History" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview Repo History" },
      { "<leader>gdt", "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview Toggle Files" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
        },
        file_history = {
          layout = "diff2_horizontal",
        },
      },
      file_panel = {
        listing_style = "tree",
        win_config = {
          position = "left",
          width = 35,
        },
      },
    },
  },
}
