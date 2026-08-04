# AGENTS.md — dotfiles

## What this is

Personal dotfiles for an Arch Linux desktop running the [Noctalia](https://github.com/noctalia-dev) shell (Wayland compositor + desktop environment). Configs are organized under `config/<app>`.

## Structure

```
config/
  noctalia/          # Desktop shell config (settings.toml + user templates)
  hypr/              # Hyprland compositor layer (used by Noctalia)
  kitty/             # Terminal emulator
  fish/              # Shell
  nvim/              # LazyVim-based Neovim config
  starship.toml      # Prompt
  gtk-3.0/           # GTK theme + bookmarks
  qt5ct/ qt6ct/      # Qt theme
  fastfetch/         # System info
  atuin/             # Shell history (DB in .gitignore)
  chrome-flags.conf  # Chromium flags (Wayland, GTK4, etc.)
  code-flags.conf    # VS Code flags (same pattern)
applications/        # .desktop files to hide from app launchers (Hidden=true)
scripts/
  nvim               # Wrapper: launches kitty with zero padding then nvim
```

## Key facts

- **No build, test, lint, or typecheck setup.** Pure config files.
- **Install** is symlink-based via `./setup install` (Python script in repo root). Purely filesystem-based (no git operations). Commands: `install`, `uninstall`, `status`; flags: `-f/--force`, `-r/--repair` (force re-link/re-copy), `-n/--dry-run`.
- **Hidden desktop entries**: curated copies of useless `.desktop` files live in `applications/` (with `Hidden=true`). `install` copies them into `~/.local/share/applications/`, shadowing the system entries. Add/remove files there to change what's hidden.
- **Symlink map is dynamic**: `config/*` -> `~/.config/*` and `scripts/*` -> `~/.local/bin/*` are discovered by scanning, so new configs are picked up automatically.
- **`scripts/nvim`** overrides `nvim` — wraps it to temporarily hide kitty padding.
- **`.gitignore`** excludes generated theme files (Noctalia renders templates at runtime). These are listed explicitly.
- **`.vscode/settings.json`** adds Hyprland Lua stubs for `Lua.workspace.library` — needed if editing Hyprland Lua configs in VS Code.
- **Noctalia user template** (`config/noctalia/user-templates.toml`): generates `config/nvim/lua/matugen.lua` from `config/nvim/lua/matugen-template.lua`, then signals nvim via `pkill -SIGUSR1 nvim`.
- **`config/fish/config.fish`** contains all aliases and custom functions (`mkcd`, `proj`, `bak`, `cpp`, `cppr`). `nvim` alias points to `~/Projects/dotfiles/scripts/nvim`.

## Adding a new config

1. Create `config/<app>/` directory.
2. Add any generated paths to `.gitignore` (see existing entries for pattern).

## Hiding a desktop entry

1. Copy the `.desktop` file from `/usr/share/applications/` into `applications/`.
2. Append `Hidden=true` to the copy.
3. Run `./setup install --repair` to re-copy the curated set.

## Common operations

```sh
# Reload fish config
source ~/.config/fish/config.fish
# or: reload

# Edit Neovim config
cd config/nvim
```
