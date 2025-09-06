# Dotfiles

![Screenshot showing different components of my default setup](./images/screenshot0.png)

![OS Support](https://img.shields.io/badge/os-macOS%20%7C%20Linux%20%7C%20WSL-blue)
![Managed with yadm](https://img.shields.io/badge/managed%20with-yadm-green)
![License](https://img.shields.io/github/license/cdanesi/dotfiles)

My personal dotfiles for macOS, Linux, and WSL environments, managed with [yadm](https://yadm.io/).

## Features

- **Cross-platform support:** macOS, Linux, and WSL
- **Managed with yadm:** simple, portable, git-based dotfile management
- **Bootstrapping:** automatically sets up environment on new systems
- **OS/device-specific configurations:**
  - macOS: [Karabiner](./.config/karabiner), [Aerospace](./.config/aerospace)
  - Linux: [i3](./.config/i3)
- **Configurations include:**
  - **Custom macOS keybindings:**
    - `CapsLock` remapped as `ESC` if tapped, `Hyper` if held
    - Keyboard layers
    - Hyper+hjkl navigation
  - **[zsh](./.zshrc):**
    - Vi-mode keybindings `ESC` or `jk`
    - [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
    - Oh My Zsh plugins (git, z, fzf, others)
    - [fzf](https://github.com/junegunn/fzf) integration for fuzzy history search and directory switching
    - [zoxide](https://github.com/ajeetdsouza/zoxide) for smarter directory jumping
    - Custom aliases and functions
  - **[Aliases](./aliases):** common utilities and shortcuts
  - **[Neovim](./.config/nvim):** modern, Lua-based configuration with:
    - Syntax highlighting
    - Treesitter integration
    - LSP setup for multiple languages
    - Fuzzy finding with Telescope
    - Autocompletion with nvim-cmp
    - Git integration via `gitsigns`
    - Custom key mappings and quality-of-life plugins
  - **[tmux](./.tmux.conf):** plugin-managed configuration with:
    - `tmux-resurrect` and `tmux-continuum` for session persistence
    - Improved status bar with battery/network indicators
    - Vi-style keybindings and pane navigation shortcuts
    - Fuzzy search session switching
    - Custom user menu
    - Nested tmux session support
    - Mouse support
  - **[Git](./.gitconfig):** configured to use [delta](https://github.com/dandavison/delta) for syntax-highlighted diffs
  - **[WezTerm](./.config/wezterm):** font, color scheme, and platform-specific tweaks
  - **[Nano](./.config/nano):** sensible options, syntax highlighting
  - Other terminal utilities and custom scripts

## Installation

Clone with yadm:

```sh
yadm clone https://github.com/cdanesi/dotfiles.git
```

Follow any bootstrap/setup instructions prompted by yadm on first run.

## Contributing

Open an issue if you find bugs, have suggestions, or want to request new features.

---

© Charles D - MIT License
