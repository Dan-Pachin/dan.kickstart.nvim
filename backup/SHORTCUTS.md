# Neovim Shortcuts Reference

This document lists all the keyboard shortcuts configured in your Neovim setup.

## Leader Key
- **Leader Key**: `<Space>` (spacebar)

---

## Basic Navigation & Editing

### General
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<Esc>` | Clear search highlights | Remove search highlighting in normal mode |
| `<leader>q` | Open diagnostic quickfix list | Show LSP diagnostic issues |

### Terminal
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<Esc><Esc>` | Exit terminal mode | Exit terminal mode (easier than `<C-\><C-n>`) |

### Window Navigation
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<C-h>` | Move focus left | Move focus to the left window |
| `<C-j>` | Move focus down | Move focus to the lower window |
| `<C-k>` | Move focus up | Move focus to the upper window |
| `<C-l>` | Move focus right | Move focus to the right window |

---

## Search & File Navigation (Telescope)

### File Operations
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>sf` | Search files | Find files in current directory |
| `<leader>sn` | Search Neovim files | Find files in Neovim config directory |
| `<leader><leader>` | Find buffers | Find existing open buffers |
| `<leader>s.` | Recent files | Search recently opened files |

### Search Operations
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>sw` | Search current word | Search for word under cursor |
| `<leader>sg` | Live grep | Search by grep in all files |
| `<leader>s/` | Grep in open files | Search by grep in currently open files |
| `<leader>/` | Fuzzy search in buffer | Search within current buffer |

### Help & System
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>sh` | Search help | Search Neovim help documentation |
| `<leader>sk` | Search keymaps | Search available key mappings |
| `<leader>ss` | Select Telescope | Open Telescope picker selection |
| `<leader>sd` | Search diagnostics | Search LSP diagnostic messages |
| `<leader>sr` | Resume search | Resume last Telescope search |

---

## Language Server Protocol (LSP)

### Code Navigation
| Shortcut | Action | Description |
|----------|--------|-------------|
| `grd` | Go to definition | Jump to definition of symbol under cursor |
| `grD` | Go to declaration | Jump to declaration of symbol under cursor |
| `gri` | Go to implementation | Jump to implementation of symbol under cursor |
| `grr` | Go to references | Find all references to symbol under cursor |
| `grt` | Go to type definition | Jump to type definition of symbol under cursor |

### Code Actions
| Shortcut | Action | Description |
|----------|--------|-------------|
| `grn` | Rename symbol | Rename symbol under cursor |
| `gra` | Code action | Execute code action (fix, refactor, etc.) |

### Symbols & Documentation
| Shortcut | Action | Description |
|----------|--------|-------------|
| `gO` | Document symbols | Show symbols in current document |
| `gW` | Workspace symbols | Show symbols in entire workspace |
| `<leader>th` | Toggle inlay hints | Toggle LSP inlay hints display |

---

## Code Formatting

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>f` | Format buffer | Format current buffer with configured formatter |

---

## Autocompletion (blink.cmp)

### Default Keymaps
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<C-y>` | Accept completion | Accept the selected completion |
| `<C-e>` | Hide menu | Hide completion menu |
| `<C-space>` | Open menu/docs | Open completion menu or documentation |
| `<C-n>` / `<C-p>` | Navigate completions | Select next/previous completion item |
| `<Tab>` / `<S-Tab>` | Navigate snippets | Move to next/previous snippet expansion |
| `<C-k>` | Toggle signature help | Toggle function signature help |

---

## Neo-tree File Explorer

### Main Operations
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>e` | Toggle Neo-tree | Toggle file explorer |
| `<leader>o` | Focus Neo-tree | Focus on Neo-tree window |
| `<leader>E` | Reveal file | Reveal current file in Neo-tree |

### Navigation
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<bs>` | Navigate up | Go to parent directory |
| `.` | Set root | Set current directory as root |
| `H` | Toggle hidden | Show/hide hidden files |

### Search & Filter
| Shortcut | Action | Description |
|----------|--------|-------------|
| `/` | Fuzzy finder | Search files in current directory |
| `D` | Fuzzy finder directory | Search directories only |
| `#` | Fuzzy sorter | Sort using fzy algorithm |
| `f` | Filter on submit | Apply filter |
| `<C-x>` | Clear filter | Remove current filter |

### Git Operations
| Shortcut | Action | Description |
|----------|--------|-------------|
| `[g` | Previous git modified | Go to previous modified file |
| `]g` | Next git modified | Go to next modified file |
| `A` | Git add all | Stage all files |
| `gu` | Git unstage file | Unstage selected file |
| `ga` | Git add file | Stage selected file |
| `gr` | Git revert file | Revert changes to file |
| `gc` | Git commit | Commit changes |
| `gp` | Git push | Push to remote |
| `gg` | Git commit and push | Commit and push in one go |

### Sorting Options
| Shortcut | Action | Description |
|----------|--------|-------------|
| `o` | Show help | Display sorting options |
| `oc` | Order by created | Sort by creation date |
| `od` | Order by diagnostics | Sort by diagnostic issues |
| `og` | Order by git status | Sort by git status |
| `om` | Order by modified | Sort by modification date |
| `on` | Order by name | Sort alphabetically |
| `os` | Order by size | Sort by file size |
| `ot` | Order by type | Sort by file type |

---

## Mini.nvim Plugins

### Text Objects (mini.ai)
| Shortcut | Action | Description |
|----------|--------|-------------|
| `va)` | Visual around paren | Select around parentheses |
| `yinq` | Yank inside next quote | Yank inside next quote |
| `ci'` | Change inside quote | Change inside single quotes |

### Surround (mini.surround)
| Shortcut | Action | Description |
|----------|--------|-------------|
| `saiw)` | Surround add inner word paren | Add parentheses around inner word |
| `sd'` | Surround delete quotes | Delete surrounding quotes |
| `sr)'` | Surround replace paren with quote | Replace parentheses with quotes |

---

## Go Development (ray-x/go.nvim)

The Go plugin provides additional commands accessible via `:Go` commands. Common ones include:
- `:GoRun` - Run current Go file
- `:GoTest` - Run tests
- `:GoBuild` - Build Go project
- `:GoInstall` - Install Go tools
- `:GoCoverage` - Show test coverage

---

## Which-Key Integration

Press any leader key combination and wait briefly to see available options:
- `<leader>s` - Search operations
- `<leader>t` - Toggle operations  
- `<leader>h` - Git hunk operations

---

## Notes

- **Leader Key**: All shortcuts starting with `<leader>` use the spacebar as the leader key
- **Mode Indicators**: 
  - `n` = Normal mode
  - `v` = Visual mode
  - `t` = Terminal mode
  - `i` = Insert mode
- **Auto-formatting**: Code is automatically formatted on save for supported languages
- **LSP Features**: Most LSP shortcuts only work when a language server is active for the current file type

---

## Vim Motions Reference

This section covers essential Vim motions and text manipulation commands that are fundamental to efficient editing.

### Basic Movement

#### Character-wise Movement
| Motion | Action | Description |
|--------|--------|-------------|
| `h` | Move left | Move cursor one character left |
| `j` | Move down | Move cursor one line down |
| `k` | Move up | Move cursor one line up |
| `l` | Move right | Move cursor one character right |
| `0` | Beginning of line | Move to beginning of current line |
| `^` | First non-blank | Move to first non-blank character |
| `$` | End of line | Move to end of current line |
| `g_` | Last non-blank | Move to last non-blank character |

#### Word Movement
| Motion | Action | Description |
|--------|--------|-------------|
| `w` | Next word | Move to beginning of next word |
| `W` | Next WORD | Move to beginning of next WORD (ignores punctuation) |
| `e` | End of word | Move to end of current word |
| `E` | End of WORD | Move to end of current WORD |
| `b` | Previous word | Move to beginning of previous word |
| `B` | Previous WORD | Move to beginning of previous WORD |
| `ge` | End of previous word | Move to end of previous word |
| `gE` | End of previous WORD | Move to end of previous WORD |

#### Line Movement
| Motion | Action | Description |
|--------|--------|-------------|
| `gg` | First line | Move to first line of file |
| `G` | Last line | Move to last line of file |
| `nG` | Line n | Move to line number n |
| `:n` | Line n | Move to line number n (command mode) |
| `+` | Next line start | Move to beginning of next line |
| `-` | Previous line start | Move to beginning of previous line |
| `Enter` | Next line start | Move to beginning of next line |

#### Screen Movement
| Motion | Action | Description |
|--------|--------|-------------|
| `H` | Top of screen | Move to top of screen |
| `M` | Middle of screen | Move to middle of screen |
| `L` | Bottom of screen | Move to bottom of screen |
| `Ctrl-f` | Page down | Move forward one screen |
| `Ctrl-b` | Page up | Move backward one screen |
| `Ctrl-d` | Half page down | Move down half a screen |
| `Ctrl-u` | Half page up | Move up half a screen |
| `Ctrl-e` | Scroll down | Scroll down one line |
| `Ctrl-y` | Scroll up | Scroll up one line |
| `zt` | Top line | Move current line to top of screen |
| `zz` | Center line | Move current line to center of screen |
| `zb` | Bottom line | Move current line to bottom of screen |

### Text Objects

#### Character-based Objects
| Object | Action | Description |
|--------|--------|-------------|
| `iw` | Inner word | Select inner word (without surrounding whitespace) |
| `aw` | A word | Select a word (with surrounding whitespace) |
| `iW` | Inner WORD | Select inner WORD |
| `aW` | A WORD | Select a WORD |
| `is` | Inner sentence | Select inner sentence |
| `as` | A sentence | Select a sentence |
| `ip` | Inner paragraph | Select inner paragraph |
| `ap` | A paragraph | Select a paragraph |

#### Delimiter Objects
| Object | Action | Description |
|--------|--------|-------------|
| `i"` | Inner quotes | Select inside double quotes |
| `a"` | A quotes | Select including double quotes |
| `i'` | Inner quotes | Select inside single quotes |
| `a'` | A quotes | Select including single quotes |
| `i(` | Inner parens | Select inside parentheses |
| `a(` | A parens | Select including parentheses |
| `i[` | Inner brackets | Select inside square brackets |
| `a[` | A brackets | Select including square brackets |
| `i{` | Inner braces | Select inside curly braces |
| `a{` | A braces | Select including curly braces |
| `i<` | Inner angle brackets | Select inside angle brackets |
| `a<` | A angle brackets | Select including angle brackets |

#### Special Objects
| Object | Action | Description |
|--------|--------|-------------|
| `it` | Inner tag | Select inside HTML/XML tag |
| `at` | A tag | Select including HTML/XML tag |
| `i,` | Inner comma | Select inside comma-separated item |
| `a,` | A comma | Select including comma-separated item |
| `i.` | Inner period | Select inside period-separated item |
| `a.` | A period | Select including period-separated item |

### Search and Jump Motions

#### Search
| Motion | Action | Description |
|--------|--------|-------------|
| `f{char}` | Find char | Find next occurrence of char on line |
| `F{char}` | Find char backward | Find previous occurrence of char on line |
| `t{char}` | Till char | Move to before next occurrence of char |
| `T{char}` | Till char backward | Move to after previous occurrence of char |
| `;` | Repeat find | Repeat last f/F/t/T command |
| `,` | Repeat find reverse | Repeat last f/F/t/T command in reverse |
| `/pattern` | Search forward | Search for pattern forward |
| `?pattern` | Search backward | Search for pattern backward |
| `n` | Next match | Go to next search match |
| `N` | Previous match | Go to previous search match |
| `*` | Search word forward | Search for word under cursor forward |
| `#` | Search word backward | Search for word under cursor backward |

#### Jump List
| Motion | Action | Description |
|--------|--------|-------------|
| `Ctrl-o` | Jump back | Go back in jump list |
| `Ctrl-i` | Jump forward | Go forward in jump list |
| `''` | Last position | Return to last position |
| `` ` `` | Last position exact | Return to last position (exact column) |
| `'.` | Last change | Go to last change |
| `` `^`` | Last insert | Go to last insert position |

### Marks

#### Setting Marks
| Command | Action | Description |
|---------|--------|-------------|
| `m{a-z}` | Set local mark | Set mark a-z in current file |
| `m{A-Z}` | Set global mark | Set mark A-Z across files |
| `m'` | Set previous context | Set mark at previous context |
| `m.` | Set last change | Set mark at last change |
| `m^` | Set last insert | Set mark at last insert |

#### Jumping to Marks
| Command | Action | Description |
|---------|--------|-------------|
| `` `{mark}`` | Jump to mark | Jump to mark (exact position) |
| `'{mark}` | Jump to mark line | Jump to line of mark |
| `` ` `` | Last position | Jump to last position |
| `'` | Last position line | Jump to line of last position |

### Advanced Motions

#### Pattern-based Movement
| Motion | Action | Description |
|--------|--------|-------------|
| `%` | Match bracket | Jump to matching bracket/paren/brace |
| `[{` | Previous unmatched | Go to previous unmatched `{` |
| `]}` | Next unmatched | Go to next unmatched `}` |
| `[(` | Previous unmatched | Go to previous unmatched `(` |
| `])` | Next unmatched | Go to next unmatched `)` |

#### Text Structure
| Motion | Action | Description |
|--------|--------|-------------|
| `{` | Previous paragraph | Move to previous paragraph |
| `}` | Next paragraph | Move to next paragraph |
| `(` | Previous sentence | Move to previous sentence |
| `)` | Next sentence | Move to next sentence |

### Combining Motions with Operators

Vim motions can be combined with operators for powerful text manipulation:

#### Common Operator + Motion Combinations
| Combination | Action | Description |
|-------------|--------|-------------|
| `d{motion}` | Delete | Delete text covered by motion |
| `c{motion}` | Change | Change text covered by motion |
| `y{motion}` | Yank | Copy text covered by motion |
| `v{motion}` | Visual | Select text covered by motion |
| `>{motion}` | Indent right | Indent text covered by motion |
| `<{motion}` | Indent left | Unindent text covered by motion |
| `gU{motion}` | Uppercase | Make text uppercase |
| `gu{motion}` | Lowercase | Make text lowercase |
| `g~{motion}` | Toggle case | Toggle case of text |

#### Examples
| Command | Action | Description |
|---------|--------|-------------|
| `dw` | Delete word | Delete from cursor to end of word |
| `di"` | Delete inside quotes | Delete text inside double quotes |
| `ci(` | Change inside parens | Change text inside parentheses |
| `yap` | Yank paragraph | Copy entire paragraph |
| `>}` | Indent paragraph | Indent current paragraph |
| `gUiw` | Uppercase word | Make current word uppercase |

### Number Prefixes

Most motions can be prefixed with numbers for repetition:
- `3w` - Move forward 3 words
- `5j` - Move down 5 lines
- `2f.` - Find 2nd occurrence of period on line
- `4dw` - Delete 4 words
- `10x` - Delete 10 characters

---

*Generated from init.lua configuration*
