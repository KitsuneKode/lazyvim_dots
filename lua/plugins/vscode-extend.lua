if not vim.g.vscode then
  return {}
end

if vim.g.vscode then
  vim.opt.cmdheight = 1 -- Or higher if messages still pop up
end

if vim.g.vscode then
  vim.g.clipboard = vim.g.vscode_clipboard
  vim.opt.clipboard = "unnamedplus"
  vim.opt.shortmess:append("sS") -- hide search count and wrap messages like [1/7], W
  vim.opt.showcmd = false -- hide partial command display like /keybo
end

local vscode = require("vscode")

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = function()
    -- Toggle explorer (like neo-tree)
    vim.keymap.set("n", "<leader>e", function()
      vscode.call("workbench.action.toggleSidebarVisibility")
    end, { desc = "Toggle explorer" })

    -- Buffer management
    vim.keymap.set("n", "<leader>bd", function()
      vscode.call("workbench.action.closeActiveEditor")
    end, { desc = "Close current tab" })

    vim.keymap.set("n", "<leader>bo", function()
      vscode.call("workbench.action.closeOtherEditors")
    end, { desc = "Close other tabs" })
  end,
})

return {}
