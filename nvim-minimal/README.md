# nvim-minimal

Small LazyVim-compatible profile for SSH and server work.

This profile intentionally avoids AI plugins, Mason-managed tool installs, language extras, Treesitter parser downloads, image support, dashboards, and desktop-specific integrations. It keeps the editor familiar enough for quick work while avoiding large downloads and background tooling on servers.

## Install from this repo

```sh
./scripts/install-nvim-minimal.sh
```

Then launch it with:

```sh
NVIM_APPNAME=nvim-minimal nvim
```

Useful shell alias:

```sh
alias snvim='NVIM_APPNAME=nvim-minimal nvim'
```

## Install on a server

After this branch has been pushed or merged:

```sh
git clone --branch server-minimal-profile https://github.com/KitsuneKode/lazyvim_dots.git ~/.local/share/kitsune-nvim
~/.local/share/kitsune-nvim/scripts/install-nvim-minimal.sh
NVIM_APPNAME=nvim-minimal nvim
```

Updating later is just:

```sh
git -C ~/.local/share/kitsune-nvim pull
```

## What stays

- LazyVim defaults and familiar config layout
- core options and your everyday navigation keymaps
- `which-key`
- `gitsigns`
- `mini.comment`
- `mini.surround`
- lightweight statusline
- Snacks picker

The profile currently resolves to 10 enabled plugins.

## What is intentionally off

- Mason and automatic LSP/tool installation
- Treesitter parser installation
- language extras
- Copilot, Avante, WakaTime, Discord presence, image support
- dashboards, completion engines, sessions, and heavier UI plugins
