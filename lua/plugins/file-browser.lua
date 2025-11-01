return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>fo",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      desc = "Browse Files",
    },
  },
  lazy = true,
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
