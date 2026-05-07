return {
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.preview_config = vim.tbl_deep_extend("force", opts.preview_config or {}, {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      })

      local default_on_attach = opts.on_attach

      opts.on_attach = function(buffer)
        if default_on_attach then
          default_on_attach(buffer)
        end

        local gs = package.loaded.gitsigns or require("gitsigns")

        vim.keymap.set("n", "ghi", gs.preview_hunk_inline, {
          buffer = buffer,
          desc = "Preview Hunk Inline",
          silent = true,
        })

        vim.keymap.set("n", "ghP", gs.preview_hunk, {
          buffer = buffer,
          desc = "Preview Hunk Popup",
          silent = true,
        })
      end
    end,
  },
}
