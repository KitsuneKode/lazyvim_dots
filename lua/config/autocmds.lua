-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- lua/plugins/lsp.lua or wherever you configure lspconfig

-- local lspconfig = require("lspconfig")
--
-- lspconfig.tailwindcss.setup({
--   root_dir = function(fname)
--     -- Force Tailwind LSP to treat monorepo root OR ui package as its root
--     return lspconfig.util.root_pattern(
--       "tailwind.config.js",
--       "tailwind.config.cjs",
--       "postcss.config.js",
--       "postcss.config.mjs",
--       "package.json"
--     )(fname) or vim.fn.getcwd()
--   end,
--   settings = {
--     tailwindCSS = {
--       experimental = {
--         classRegex = { "clsx\\(([^)]*)\\)", "cva\\(([^)]*)\\)" }, -- example if using shadcn/ui
--       },
--     },
--   },
-- })

-- diagnostic
local og_virt_text
local og_virt_line

vim.o.signcolumn = "yes"

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = { only_current_line = true },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

local function update_diagnostics()
  local bufnr = vim.api.nvim_get_current_buf()
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  if og_virt_line == nil then
    og_virt_line = vim.diagnostic.config().virtual_lines
  end

  if not (og_virt_line and og_virt_line.only_current_line) then
    if og_virt_text then
      vim.diagnostic.config({ virtual_text = og_virt_text })
      og_virt_text = nil
    end
    return
  end

  if og_virt_text == nil then
    og_virt_text = vim.diagnostic.config().virtual_text
  end

  local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
  local line_diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })

  if vim.tbl_isempty(line_diagnostics) then
    vim.diagnostic.config({ virtual_text = og_virt_text })
  else
    vim.diagnostic.config({ virtual_text = false })
  end
end

-- Create debounced version for insert mode
local update_diagnostics_debounced = vim.schedule_wrap(function()
  vim.defer_fn(update_diagnostics, 50)
end)

vim.api.nvim_create_augroup("diagnostic_only_virtlines", { clear = true })

-- Immediate updates in normal mode
vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
  group = "diagnostic_only_virtlines",
  callback = update_diagnostics,
})

-- Debounced updates in insert mode
vim.api.nvim_create_autocmd("CursorMovedI", {
  group = "diagnostic_only_virtlines",
  callback = update_diagnostics_debounced,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  group = "diagnostic_only_virtlines",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_is_valid(bufnr) then
      pcall(vim.diagnostic.show, nil, bufnr)
    end
    update_diagnostics()
  end,
})
