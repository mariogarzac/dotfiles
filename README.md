# Mario's Dotfiles

Personal dotfiles for macOS. Run `install.sh` to set everything up from scratch.

## Structure

### `AeroSpace/`
Window manager config for [AeroSpace](https://github.com/nikitabobko/AeroSpace) — tiling window manager for macOS.

### `config/`
Configs that live under `~/.config/`. Symlink the whole directory or individual subdirs.

- **nvim/** — Neovim config using lazy.nvim. Plugins include LSP, Treesitter, Telescope, Harpoon, Fugitive, Lualine, and the Everforest colorscheme.

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
