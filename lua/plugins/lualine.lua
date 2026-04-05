return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local colors = {
        bg = "#1e1e2e",
        fg = "#cdd6f4",
        yellow = "#f9e2af",
        cyan = "#89dceb",
        darkblue = "#89b4fa",
        green = "#a6e3a1",
        orange = "#fab387",
        violet = "#cba6f7",
        magenta = "#f5c2e7",
        blue = "#89b4fa",
        red = "#f38ba8",
      }

      local nvchad_theme = {
        normal = {
          a = { fg = colors.bg, bg = colors.green, gui = "bold" },
          b = { fg = colors.fg, bg = colors.bg },
          c = { fg = colors.fg, bg = colors.bg },
        },
        insert = {
          a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        },
        visual = {
          a = { fg = colors.bg, bg = colors.violet, gui = "bold" },
        },
        replace = {
          a = { fg = colors.bg, bg = colors.red, gui = "bold" },
        },
        command = {
          a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
        },
        inactive = {
          a = { fg = colors.fg, bg = colors.bg },
          b = { fg = colors.fg, bg = colors.bg },
          c = { fg = colors.fg, bg = colors.bg },
        },
      }

      -- Function to extract PS1 from zsh configuration
      local function get_ps1_from_zsh()
        local zsh_config_dir = os.getenv("HOME") .. "/.config/zsh"
        local ps1 = nil

        -- Try to read from .zshrc
        local zshrc_file = io.open(zsh_config_dir .. "/.zshrc", "r")
        if zshrc_file then
          for line in zshrc_file:lines() do
            -- Look for PS1 export or assignment
            if line:match("^export%s+PS1") or line:match("^PS1=") then
              ps1 = line:match("PS1=['\"]?([^'\"]*)['\"]?")
              if ps1 then break end
            end
          end
          zshrc_file:close()
        end

        -- If not found in .zshrc, try prompt.zsh
        if not ps1 then
          local prompt_file = io.open(zsh_config_dir .. "/prompt.zsh", "r")
          if prompt_file then
            for line in prompt_file:lines() do
              if line:match("^export%s+PS1") or line:match("^PS1=") then
                ps1 = line:match("PS1=['\"]?([^'\"]*)['\"]?")
                if ps1 then break end
              end
            end
            prompt_file:close()
          end
        end

        return ps1 or "zsh"
      end

      opts.options = {
        theme = nvchad_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      }

      opts.sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = "",
              readonly = "",
              unnamed = "",
            },
          },
        },
        lualine_c = {
          {
            "branch",
            icon = "",
          },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
        },
        lualine_y = {
          {
            function()
              local msg = "No LSP"
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            icon = " ",
            color = { fg = colors.violet, gui = "bold" },
          },
        },
        lualine_z = {
          { "location" },
          { "progress" },
          {
            function()
              return get_ps1_from_zsh()
            end,
            icon = "",
            color = { fg = colors.cyan, gui = "bold" },
          },
        },
      }

      return opts
    end,
  },
}
