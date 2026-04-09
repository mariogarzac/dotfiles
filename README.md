# Mario's Dotfiles

Personal dotfiles for macOS. Run `install.sh` to set everything up from scratch.

## Structure

### `AeroSpace/`
Window manager config for [AeroSpace](https://github.com/nikitabobko/AeroSpace) — tiling window manager for macOS.

### `config/`
Configs that live under `~/.config/`. Symlink the whole directory or individual subdirs.

- **nvim/** — Neovim config using lazy.nvim. Plugins include LSP, Treesitter, Telescope, Harpoon, Fugitive, Lualine, and the Everforest colorscheme.
- **dunst/** — Notification daemon config (Linux legacy, unused on macOS).
- **i3/** — i3 window manager config with polybar launch script (Linux legacy).
- **picom/** — Compositor config for smooth animations and transparency (Linux legacy).
- **polybar/** — Status bar config with scripts for launchers, power menu, updates, and network (Linux legacy).
- **rofi/** — App launcher and dmenu replacement config with Everforest theme (Linux legacy).
- **display/** — `.xsessionrc` for display setup on login (Linux legacy).

### `ghostty/`
Config for [Ghostty](https://ghostty.org/) terminal emulator. Includes the main `config` file and a custom `themes/` directory with the Everforest dark theme.

### `obsidian/`
Obsidian vault settings — plugins, hotkeys, appearance, and workspace layout.

### `zsh/`
Zsh config split across focused files:
- `.zshrc` — entry point, loads oh-my-zsh and sources the other files
- `.p10k.zsh` — Powerlevel10k prompt config
- `.tmux.conf` — tmux config
- `aliases.zsh` — shell aliases
- `functions.zsh` — shell functions
- `paths.zsh` — `$PATH` additions
- `theme.zsh` — terminal theme/appearance tweaks
