return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close DiffView" },
  },
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true, -- See better diff highlights
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
        },
      },
    })
  end,
}
