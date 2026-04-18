local in_ksb = vim.env.KITTY_SCROLLBACK_NVIM == 'true'


return {
  { 'folke/persistence.nvim',   cond = not in_ksb },
  { 'akinsho/bufferline.nvim',  cond = not in_ksb },
  { 'andweeb/presence.nvim',    cond = not in_ksb },
  { 'wakatime/vim-wakatime',    cond = not in_ksb },
  { 'zbirenbaum/copilot.lua',   cond = not in_ksb },

  {
    'mikesmithgh/kitty-scrollback.nvim',
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
    event = { 'User KittyScrollbackLaunch' },
    config = function()
      require('kitty-scrollback').setup({
        -- Global config applied to all modes
        {
          status_window = {
            enabled = true,
            autoclose = false,
            show_timer = false,
          },
          paste_window = {
            highlight_as_normal_win = true,  -- paste window looks like a normal buffer
            hide_footer = false,             -- show keybind hints at bottom
            winblend = 0,
          },
          kitty_get_text = {
            ansi = true,
            extent = 'all',
            clear_selection = true,
          },
        },
        -- Search mode: open scrollback and immediately enter backward search
        search = {
          callbacks = {
            after_ready = function()
              vim.api.nvim_feedkeys('?', 'n', false)
            end,
          },
        },
      })
    end,
  },
}
