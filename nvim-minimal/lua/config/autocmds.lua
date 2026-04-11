vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("minimal_highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})
