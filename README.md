# custom-neovim-config

**A personal Neovim configuration**  
Forked and extended from the excellent [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

This repository started its life as a direct clone of **kickstart.nvim** — a small, single-file, fully documented starting point created by the Neovim Lua community.  
Everything good here was made possible by that project and its contributors.

I maintain this fork as **my daily driver** and gradually add the tools, keybindings, and quality-of-life tweaks I actually use (Mason packages, disabled autopairs, custom LSP setup, etc.).

## What's different from stock kickstart.nvim?

- Mason packages I use daily recommended if you are a backend/Devops (dockerls, docker-compose-language-service, eslint_d, prettierd, etc.)
- `nvim-autopairs` - explicitly enabled (I hate manually-closing brackets/quotes)
- Minor personal keybindings and options
- Multiple Custom plugins like a File Explorer (like vscode), 
- `auto-save` - for auto saving file without explicitly typing `<leader>w` it saves buffer when switching from Insert mode to Normal mode. 
- `toggle-term` - for floating Terminal(or horizontal) like Vscode but Better :).
- `bufferline` shows all your open buffers like tabs  with names, icons, close buttons, modifications indicator, etc.
- `Telescope` - for File searching and navigation
- `markdown-preview` - for better Github like MD file preview.
- `avante` (optional) -  for AI Copilot  features (current configuration is set to Gemini) make sure to add your gemini api key to environment `export GEMINI_API_KEY="your key"` to your   `~/.bashrc` or  `~/.zshrc` (for zsh terminal) 
- Everything else is intentionally kept as close as possible to the original kickstart design


## Installation

```sh
# Linux / macOS
git clone https://github.com/HiyawNT/custom-neovim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# Windows PowerShell
git clone https://github.com/HiyawNT/custom-neovim-config.git "$env:LOCALAPPDATA\nvim"

# Windows cmd
git clone https://github.com/HiyawNT/custom-neovim-config.git "%localappdata%\nvim"
```

Then just run `nvim` — Lazy will install everything on first launch.

## Theme

- `catppuccin` -  Best Theme ever fight me.
- `lunarhaze-theme` - a clean, minimalist, NvChad-inspired lualine theme made for people who want maximum beauty with zero clutter.
Elegant rounded powerline separators, perfectly balanced sections, single global statusline, and tasteful highlights that play nicely with catppuccin, tokyonight, gruvbox, or any dark/light colorscheme.
No noisy icons, no wasted space — just your mode, branch, filename, diagnostics, and location, arranged exactly like the famous NvChad statusline everyone screenshots :) .

## Custom Keybindings

This configuration includes several productivity-focused keybindings designed to streamline your workflow:

*Note: `<leader>` is typically mapped to the spacebar in this configuration.*

### Insert Mode Shortcuts

| Keybinding | Action | Description |
|------------|--------|-------------|
| `jk` | `<Esc>` | Quick escape to normal mode |
| `<C-s>` | Save all modified | Saves all modified buffers at once |

### Normal Mode - File Operations

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>w` | `:w` | Save current buffer |
| `<C-s>` | Save all | Save all modified buffers |
| `<leader>q` | `:q` | Quit current window |
| `<leader>qq` | Quit all | Quit all windows (force if dirty) |
| `<leader>wq` | `:wq` | Write and quit window |
| `<leader>WQ` | `:wq!` | Write and quit window (force) |
| `<leader>wa` | Write all & quit | Save all buffers and quit Neovim |

### Normal Mode - Editing Without Yanking

These commands perform their normal operations but don't pollute your yank register:

| Keybinding | Action | Description |
|------------|--------|-------------|
| `S` | Change line | Change entire line without yanking |
| `C` | Change to EOL | Change to end of line without yanking |
| `D` | Delete to EOL | Delete to end of line without yanking |
| `<leader>d` | Delete file | Delete entire file content without yanking |

### Visual Mode - Smart Paste

| Keybinding | Action | Description |
|------------|--------|-------------|
| `p` | Paste over | Paste without yanking replaced text |
| `P` | Paste over | Paste without yanking replaced text |

### Terminal Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>tt` | Toggle float terminal | Open/close floating terminal |
| `<leader>th` | Toggle horizontal terminal | Open/close horizontal split terminal |
| `<leader>tv` | Toggle vertical terminal | Open/close vertical split terminal |
| `<Esc>` (in terminal) | Exit terminal mode | Return to normal mode |

### File Selection

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>y` | Select all | Select entire file content |

## Features

- **Smart Pasting**: Paste over selected text without losing your clipboard content
- **No-Yank Operations**: Delete and change operations that don't clutter your registers
- **Quick Save/Quit**: Efficient file management shortcuts
- **Integrated Terminal**: Toggle between different terminal layouts
- **Quick Escape**: Use `jk` to exit insert mode faster than reaching for `<Esc>`

## Credits & License

**Original template & vast majority of the code**: [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) by the Neovim Lua community (MIT license)

**My additions**: Also released under the same MIT license

Feel free to fork, steal, or laugh at my preferences — just keep the attribution chain alive.

## Happy Vimming!

---

