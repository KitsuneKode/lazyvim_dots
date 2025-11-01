return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<leader>tt]], -- Main toggle
    direction = "horizontal",
    shade_terminals = false,
  },
  keys = {
    -- { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    -- { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    -- { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "ToggleTerm vertical split" },
    -- { "<leader>tl", "<cmd>lua _lazygit_toggle()<cr>", desc = "ToggleTerm lazygit" },
    { "<leader>tn", "<cmd>lua _node_toggle()<cr>", desc = "ToggleTerm node" },
    { "<leader>tp", "<cmd>lua _python_toggle()<cr>", desc = "ToggleTerm python" },

    {
      "<leader>tf",
      function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 0, LazyVim.root.get(), "float")
      end,
      desc = "ToggleTerm (float root_dir)",
    },
    {
      "<leader>th",
      function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 15, LazyVim.root.get(), "horizontal")
      end,
      desc = "ToggleTerm (horizontal root_dir)",
    },
    {
      "<leader>tv",
      function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
      end,
      desc = "ToggleTerm (vertical root_dir)",
    },
    {
      "<leader>tN",
      "<cmd>ToggleTermSetName<cr>",
      desc = "Set term name",
    },
    {
      "<leader>ts",
      "<cmd>TermSelect<cr>",
      desc = "Select term",
    },
    {
      "<leader>tt",
      function()
        require("toggleterm").toggle(1, 100, LazyVim.root.get(), "tab")
      end,
      desc = "ToggleTerm (tab root_dir)",
    },
    {
      "<leader>tt",
      function()
        require("toggleterm").toggle(1, 100, vim.loop.cwd(), "tab")
      end,
      desc = "ToggleTerm (tab cwd_dir)",
    },
  },
}
