# Neovim Aesthetic Overhaul — Full Summary

Everything changed from the base kickstart-like config across two sessions.

---

## Colorscheme

### Changed: Kanagawa → Nordic

- **Plugin**: `AlexvZyl/nordic.nvim`
- **Old**: `rebelot/kanagawa.nvim` with default config
- **Config**:
  - `bold_keywords = true`
  - `italic_comments = true`
  - `transparent = { bg = false, float = false }`
  - `bright_half = true`
  - `reduced_blue = true`
  - `swap_backgrounds = false`
  - `cursorline = { theme = "dark", blend = 0.7, bold = false }`
  - `noice = { style = "flat" }`
  - `telescope = { style = "flat" }`
  - `ts_context = { dark_background = true }`
  - Custom highlight overrides:
    - `WinSeparator` → `palette.gray2`
    - `FloatBorder` → `fg = palette.gray3, bg = palette.black1`
    - `NormalFloat` → `bg = palette.black1`
- All old commented-out colorscheme blocks were removed from lazy.lua

---

## Options (user/options.lua)

### Added
- `vim.opt.termguicolors = true`
- `vim.opt.pumblend = 10` — translucent popup menus
- `vim.opt.winblend = 10` — translucent floating windows
- `vim.opt.fillchars = { eob = ' ', vert = '│', horiz = '─', horizup = '┴', horizdown = '┬', vertleft = '┤', vertright = '├', verthoriz = '┼' }` — unicode box-drawing separators, no `~` tildes
- `vim.opt.foldmethod = 'expr'` — treesitter-based folding
- `vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'`
- `vim.opt.foldlevel = 99` — start with everything unfolded
- `vim.opt.foldlevelstart = 99`

### Folding keybinds (built-in vim)
- `za` — toggle fold under cursor
- `zc` — close fold
- `zo` — open fold
- `zM` — close ALL folds
- `zR` — open ALL folds

---

## New Plugins Added

### 1. Lualine (statusline) — `nvim-lualine/lualine.nvim`
**Replaces**: `mini.statusline` (removed from mini.nvim config)

- Theme: `nordic`
- Separators: `│` (component), `` (section)
- `globalstatus = true`
- Hidden on dashboard
- Sections:
  - **A**: Mode (truncated to 3 chars)
  - **B**: Branch (`` icon), diff (`+`, `~`, `-` symbols)
  - **C**: Filetype icon + filename (relative path, `●` for modified)
  - **X**: Diagnostics (error/warn/info/hint icons)
  - **Y**: Filetype
  - **Z**: Location + progress

### 2. Noice (UI replacement) — `folke/noice.nvim`
**Dependencies**: `MunifTanjim/nui.nvim`, `rcarriga/nvim-notify`

- Floating cmdline popup with icons:
  - `:` commands → ` ` icon
  - `/` search → `  ` icon
  - `?` search → `  ` icon
  - `!` filter → ` $ ` icon
  - Lua → ` ` icon
- Messages → notify view
- Popupmenu → nui backend
- LSP: hover enabled, signature disabled (blink handles it), progress as mini view
- Presets: command_palette, lsp_doc_border, long_message_to_split

### nvim-notify config:
- Stages: fade
- Timeout: 3000ms
- Render: wrapped-compact
- Max width: 50

### 3. Bufferline (buffer tabs) — `akinsho/bufferline.nvim`
- Mode: buffers
- LSP diagnostics with icons
- Neo-tree offset: "  File Explorer" header
- Thin separators
- No close icons
- Only shows when multiple buffers open
- **Keybinds**:
  - `Shift+H` — previous buffer
  - `Shift+L` — next buffer
  - `<leader>bp` — pin buffer
  - `<leader>bx` — close buffer

### 4. Indent Blankline — `lukas-reineke/indent-blankline.nvim`
- Indent char: `│`
- Scope highlighting in Nordic blue (`#81A1C1`)
- Scope: show start/end disabled
- Excluded filetypes: help, dashboard, neo-tree, lazy, mason, notify

### 5. Dashboard — `nvimdev/dashboard-nvim`
- Theme: doom
- ASCII "NEOVIM" header
- Center actions:
  - `f` — Find File (telescope)
  - `n` — New File
  - `r` — Recent Files
  - `g` — Find Word (live grep)
  - `c` — Config
  - `p` — Plugins (Lazy)
  - `q` — Quit
- Footer: plugin load count

### 6. Dressing (better UI dialogs) — `stevearc/dressing.nvim`
- Input: rounded border, cursor-relative, width 40, winblend 10
- Select: telescope backend with builtin fallback

### 7. Flash (navigation) — `folke/flash.nvim`
- **Keybinds**:
  - `s` (normal/visual/operator) — jump to any text with labels
  - `S` (normal/visual/operator) — treesitter node selection
  - `r` (operator-pending) — remote flash
  - `R` (operator/visual) — treesitter search
- Search mode disabled (doesn't hijack `/`)
- Char mode: jump labels enabled

### 8. Trouble (diagnostics panel) — `folke/trouble.nvim`
- **Keybinds**:
  - `<leader>xx` — all diagnostics
  - `<leader>xX` — current buffer diagnostics
  - `<leader>xs` — symbols outline (40% width)
  - `<leader>xl` — location list
  - `<leader>xq` — quickfix list
  - `<leader>xt` — todo comments

### 9. Smear Cursor (animated cursor) — `sphamba/smear-cursor.nvim`
- Stiffness: 0.8
- Trailing stiffness: 0.5
- Distance stop animating: 0.5
- Smear between buffers: true
- Smear between neighbor lines: true

---

## Modified Plugins

### Blink.cmp (completion) — `saghen/blink.cmp`
**Was**: basic config with enter preset and documentation auto-show

**Now**:
- Ghost text enabled (inline grey preview of top completion)
- Rounded borders on menu, documentation, and signature windows
- Documentation auto-show with 200ms delay
- Treesitter highlighting in menu for LSP items
- Custom kind icons for all 23 completion types
- Menu columns: item index (1-9) | kind icon (padded) | label + description | kind text + source name
- Signature help: enabled with rounded border

### Telescope — `nvim-telescope/telescope.nvim`
**Added defaults**:
- Prompt prefix: `   `
- Selection caret: `  `
- Entry prefix: `  `
- Sorting strategy: ascending
- Layout: horizontal, prompt on top, preview 55% width
- Window: 87% wide, 80% tall
- Rounded borderchars: `╭╮╯╰`

### Neo-tree — `nvim-neo-tree/neo-tree.nvim`
**Added**:
- Indent expanders: `` (collapsed), `` (expanded)
- Folder icons: `󰉋` (closed), `󰝰` (open), `󰉖` (empty)
- Modified symbol: `●`
- Git status symbols: ``, ``, `✖`, `󰁕`, ``, ``, `󰄱`, ``, ``
- Window width: 35
- Filtered items: dotfiles hidden, gitignored hidden (toggle with `H` and `I`)
- Follow current file enabled
- File watcher enabled (libuv)

### Mini.nvim — `echasnovski/mini.nvim`
**Removed**: `mini.statusline` setup (replaced by lualine)
**Kept**: `mini.ai` and `mini.surround`

### AutoSave — `Pocco81/AutoSave.nvim`
**Added**: `execution_message = { message = '' }` — silences save notifications

### Autopairs — `windwp/nvim-autopairs`
**Removed**: nvim-cmp dependency and cmp integration (was broken since blink.cmp is used, not nvim-cmp)
**Now**: just `opts = {}`

### Treesitter — `nvim-treesitter/nvim-treesitter`
**Added languages**: javascript, typescript, tsx, css, json, python, rust, go, fish

### Which-key — `folke/which-key.nvim`
**Added groups**:
- `<leader>b` → `[B]uffer`
- `<leader>x` → `Trouble`

---

## Removed Plugins
- `neoscroll.nvim` — was added then removed (user didn't like smooth scrolling)

---

## All Custom Keybinds Summary

### Bufferline
| Key | Action |
|-----|--------|
| `Shift+H` | Previous buffer |
| `Shift+L` | Next buffer |
| `<leader>bp` | Pin buffer |
| `<leader>bx` | Close buffer |

### Flash
| Key | Mode | Action |
|-----|------|--------|
| `s` | n, x, o | Jump to text |
| `S` | n, x, o | Treesitter select |
| `r` | o | Remote flash |
| `R` | o, x | Treesitter search |

### Trouble
| Key | Action |
|-----|--------|
| `<leader>xx` | All diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xs` | Symbols (40% width) |
| `<leader>xl` | Location list |
| `<leader>xq` | Quickfix list |
| `<leader>xt` | Todo comments |

### Folding (built-in)
| Key | Action |
|-----|--------|
| `za` | Toggle fold |
| `zc` | Close fold |
| `zo` | Open fold |
| `zM` | Close all folds |
| `zR` | Open all folds |

### Pre-existing (unchanged)
| Key | Action |
|-----|--------|
| `<leader>sf` | Search files |
| `<leader>sg` | Search by grep |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search select telescope |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Search resume |
| `<leader>s.` | Search recent files |
| `<leader>sn` | Search neovim files |
| `<leader>s/` | Search in open files |
| `<leader>/` | Fuzzy search current buffer |
| `<leader><leader>` | Find buffers |
| `<leader>f` | Format buffer |
| `<leader>lg` | LazyGit |
| `<leader>ts` | Toggle auto save |
| `<leader>mp` | Markdown preview toggle |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename |
| `<leader>q` | Diagnostic quickfix list |
| `<leader>th` | Toggle inlay hints |
| `\\` | Toggle neo-tree |
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<Esc>` | Clear search highlight |
| `Ctrl+h/j/k/l` | Window navigation |

---

## Full Plugin List (final state)

### UI / Aesthetic
1. `AlexvZyl/nordic.nvim` — colorscheme
2. `nvim-lualine/lualine.nvim` — statusline
3. `akinsho/bufferline.nvim` — buffer tabs
4. `folke/noice.nvim` — cmdline/messages/popupmenu UI
5. `rcarriga/nvim-notify` — notification UI
6. `lukas-reineke/indent-blankline.nvim` — indent guides
7. `nvimdev/dashboard-nvim` — startup screen
8. `stevearc/dressing.nvim` — better vim.ui dialogs
9. `sphamba/smear-cursor.nvim` — animated cursor

### Navigation / Productivity
10. `folke/flash.nvim` — jump navigation
11. `folke/trouble.nvim` — diagnostics panel
12. `nvim-telescope/telescope.nvim` — fuzzy finder
13. `nvim-neo-tree/neo-tree.nvim` — file explorer
14. `folke/which-key.nvim` — keybind hints
15. `folke/todo-comments.nvim` — highlight TODOs

### Completion / LSP
16. `saghen/blink.cmp` — completion engine
17. `rafamadriz/friendly-snippets` — snippet collection
18. `neovim/nvim-lspconfig` — LSP config
19. `williamboman/mason.nvim` — LSP installer
20. `williamboman/mason-lspconfig.nvim` — mason + lspconfig bridge
21. `WhoIsSethDaniel/mason-tool-installer.nvim` — tool installer
22. `j-hui/fidget.nvim` — LSP progress

### Editing
23. `echasnovski/mini.nvim` — ai textobjects + surround
24. `windwp/nvim-autopairs` — auto close brackets
25. `windwp/nvim-ts-autotag` — auto close HTML tags
26. `nvim-treesitter/nvim-treesitter` — syntax parsing
27. `stevearc/conform.nvim` — formatter
28. `mfussenegger/nvim-lint` — linter
29. `tpope/vim-sleuth` — auto detect indent
30. `Pocco81/AutoSave.nvim` — auto save

### Other
31. `folke/lazydev.nvim` — lua dev helpers
32. `Bilal2453/luvit-meta` — luvit types
33. `kdheepak/lazygit.nvim` — lazygit integration
34. `iamcco/markdown-preview.nvim` — markdown preview
35. `vyfor/cord.nvim` — discord presence
36. `greggh/claude-code.nvim` — claude code integration
37. `github/copilot.vim` — github copilot
