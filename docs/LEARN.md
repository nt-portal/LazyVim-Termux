# 📖 LEARN — Panduan Lengkap LazyVim Termux

> Dokumentasi cara pakai, keybinding, dan konfigurasi semua plugin.

---

## 📑 Daftar Isi

- [Instalasi](#-instalasi)
- [Navigasi Dasar Neovim](#-navigasi-dasar-neovim)
- [LazyVim Keybinding](#-lazyvim-keybinding)
- [CodeCompanion — AI Chat & Agent](#-codecompanion--ai-chat--agent)
- [Minuet AI — Autocomplete / Ghost Text](#-minuet-ai--autocomplete--ghost-text)
- [Ganti Provider AI](#-ganti-provider-ai)
- [Dracula Theme](#-dracula-theme)
- [Transparent Background](#-transparent-background)
- [Markview — Markdown Preview](#-markview--markdown-preview)
- [Markmap — Mind Map dari Markdown](#-markmap--mind-map-dari-markdown)
- [Error Lens](#-error-lens)
- [WakaTime — Tracking Waktu Coding](#-wakatime--tracking-waktu-coding)
- [Tips & Trik Termux](#-tips--trik-termux)
- [Troubleshooting](#-troubleshooting)

---

## 📦 Instalasi

```bash
curl -sL https://raw.githubusercontent.com/nt-portal/LazyVim-Termux/main/install.sh | bash
```

Script otomatis akan:
1. Install semua dependency (`neovim`, `nodejs`, `yarn`, `fd`, `grep`, `clang`, `curl`, `git`)
2. Backup config Neovim lama (jika ada)
3. Clone [LazyVim starter](https://github.com/LazyVim/starter)
4. Download semua plugin config ke `~/.config/nvim/lua/plugins/`
5. Install font JetBrainsMono Nerd Font
6. Buka Neovim (Lazy.nvim auto-install plugin)

---

## 🧭 Navigasi Dasar Neovim

| Key | Mode | Fungsi |
|-----|------|--------|
| `i` | Normal | Masuk Insert mode |
| `Esc` | Insert | Kembali ke Normal mode |
| `h j k l` | Normal | Gerak kiri/bawah/atas/kanan |
| `w` / `b` | Normal | Lompat per kata maju/mundur |
| `gg` / `G` | Normal | Ke awal/akhir file |
| `dd` | Normal | Hapus baris |
| `yy` | Normal | Copy baris |
| `p` | Normal | Paste |
| `u` | Normal | Undo |
| `Ctrl+r` | Normal | Redo |
| `:w` | Command | Simpan file |
| `:q` | Command | Keluar |
| `:wq` | Command | Simpan & keluar |

---

## ⌨️ LazyVim Keybinding

Leader key = `Space`

| Key | Fungsi |
|-----|--------|
| `Space` | Tampilkan menu utama |
| `Space f f` | Cari file (Telescope) |
| `Space f g` | Grep/cari teks di semua file |
| `Space e` | Toggle file explorer (Neo-tree) |
| `Space b d` | Tutup buffer aktif |
| `Space b b` | Daftar buffer terbuka |
| `Space l` | Menu Lazy (plugin manager) |
| `Space c a` | Code action (LSP) |
| `Space c r` | Rename symbol (LSP) |
| `g d` | Go to definition |
| `g r` | Go to references |
| `K` | Hover documentation |
| `Space /` | Comment toggle |

---

## 🤖 CodeCompanion — AI Chat & Agent

**Kegunaan:** Chat dengan AI langsung di Neovim. Bisa juga mode Agent (otomatis edit code, jalankan command — mirip Cursor/Windsurf).

### Cara Pakai

| Command | Fungsi |
|---------|--------|
| `:CodeCompanionChat` | Buka jendela chat AI |
| `:CodeCompanionChat Toggle` | Toggle chat (buka/tutup) |
| `:CodeCompanionActions` | Menu aksi AI |
| `:CodeCompanion <prompt>` | Inline prompt (edit code langsung) |

### Mode Agent

1. Buka chat: `:CodeCompanionChat`
2. Ketik `/Agent` di chat window
3. AI akan bisa mengedit file, menjalankan command, dll

### Mode Inline

Seleksi code di Visual mode, lalu:

```
:'<,'>CodeCompanion refactor this function
```

AI akan mengedit code yang diseleksi langsung.

### Contoh Prompt

```
# Di chat window:
Buatkan fungsi Python untuk sorting linked list
Jelaskan error di file ini
Refactor code ini agar lebih clean

# Inline (setelah seleksi):
:'<,'>CodeCompanion tambahkan error handling
:'<,'>CodeCompanion convert ke TypeScript
```

### Keybinding (recommended tambahkan di config)

```lua
-- Tambahkan di ~/.config/nvim/lua/config/keymaps.lua
vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat" })
vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
vim.keymap.set("v", "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat" })
```

---

## ✨ Minuet AI — Autocomplete / Ghost Text

**Kegunaan:** Saran kode otomatis muncul saat mengetik (ghost text abu-abu), mirip GitHub Copilot atau Windsurf autocomplete.

### Cara Aktifkan

```vim
:Minuet virtualtext enable
```

> Setelah diaktifkan, saran muncul otomatis saat mengetik di Insert mode.

### Keybinding (di Insert mode)

| Key | Fungsi |
|-----|--------|
| `Alt+a` | ✅ Terima semua saran |
| `Alt+l` | Terima satu baris saja |
| `Alt+e` | ❌ Tolak/dismiss saran |
| `Alt+n` | Lihat saran berikutnya |
| `Alt+p` | Lihat saran sebelumnya |

### Command

| Command | Fungsi |
|---------|--------|
| `:Minuet virtualtext enable` | Aktifkan ghost text |
| `:Minuet virtualtext disable` | Matikan ghost text |
| `:Minuet change_provider` | Ganti provider AI |

> **Tips Termux:** Jika `Alt` tidak berfungsi, buka Termux settings → atur `extra-keys` atau gunakan kombinasi `Esc` lalu hurufnya (contoh: `Esc` lalu `a` = `Alt+a`).

---

## 🔄 Ganti Provider AI

Kedua plugin (CodeCompanion & Minuet) mendukung 3 provider:

| Provider | Model | Keterangan |
|----------|-------|------------|
| **OpenAI** | `gpt-4o` / `gpt-4o-mini` | ✅ Aktif default |
| **Anthropic** | `claude-sonnet-4-20250514` | Di-comment, uncomment untuk pakai |
| **9Router** | `VibeCodes` | Di-comment, uncomment untuk pakai (lokal) |

### Langkah Ganti Provider

#### CodeCompanion (`plugins/codecompanion.lua`)

1. Buka file: `nvim ~/.config/nvim/lua/plugins/codecompanion.lua`
2. Di bagian `strategies`, comment adapter lama, uncomment yang baru:
   ```lua
   chat = {
     -- adapter = "openai",       -- comment ini
     adapter = "anthropic",       -- uncomment ini
   },
   ```
3. Di bagian `adapters`, comment blok lama, uncomment blok baru
4. Isi API key di blok adapter yang di-uncomment

#### Minuet (`plugins/minuet.lua`)

1. Buka file: `nvim ~/.config/nvim/lua/plugins/minuet.lua`
2. Ganti `provider`:
   ```lua
   provider = "openai_compatible",  -- ganti dari "openai"
   ```
3. Uncomment blok `openai_compatible` yang diinginkan
4. Isi API key

### Pasang API Key

Ganti placeholder di file plugin:

```
YOUR_OPENAI_API_KEY     →  sk-xxxxxxxxxxxxxxx (dari platform.openai.com)
YOUR_ANTHROPIC_API_KEY  →  sk-ant-xxxxxxxxxxxxx (dari console.anthropic.com)
YOUR_9ROUTER_API_KEY    →  key dari 9Router lokal
```

> ⚠️ **JANGAN** commit API key ke Git! Tambahkan ke `.gitignore` atau gunakan environment variable.

---

## 🧛 Dracula Theme

Theme Dracula sudah aktif otomatis. Warna gelap dengan aksen ungu/pink/hijau.

Jika ingin kembali ke theme default LazyVim:

```lua
-- Comment/hapus isi plugins/dracula.lua, atau ganti colorscheme:
vim.cmd.colorscheme("tokyonight")
```

---

## 🪟 Transparent Background

Background Neovim transparan, mengikuti wallpaper Termux.

| Command | Fungsi |
|---------|--------|
| `:TransparentEnable` | Aktifkan transparansi |
| `:TransparentDisable` | Matikan transparansi |
| `:TransparentToggle` | Toggle transparansi |

---

## 📝 Markview — Markdown Preview

Render Markdown langsung di buffer Neovim (heading berwarna, list rapi, code block highlight).

- Otomatis aktif saat buka file `.md`
- Tidak perlu browser

---

## 🗺️ Markmap — Mind Map dari Markdown

Buat mind map visual dari file Markdown.

| Command | Fungsi |
|---------|--------|
| `:MarkmapOpen` | Buka mind map dari file .md |
| `:MarkmapWatch` | Auto-update mind map saat edit |
| `:MarkmapWatchStop` | Stop auto-update |
| `:MarkmapSave` | Simpan mind map sebagai HTML |

---

## 🔴 Error Lens

Menampilkan pesan error/warning LSP langsung di samping baris kode (inline).

- Otomatis aktif saat LSP terhubung
- Tidak perlu konfigurasi tambahan
- Warna error merah, warning kuning

---

## ⏱️ WakaTime — Tracking Waktu Coding

Catat berapa lama kamu coding per project/bahasa/file.

1. Pertama kali buka Neovim, akan diminta API key WakaTime
2. Daftar di [wakatime.com](https://wakatime.com) → ambil API key dari Settings
3. Paste API key saat diminta
4. Dashboard statistik di [wakatime.com/dashboard](https://wakatime.com/dashboard)

---

## 💡 Tips & Trik Termux

### Extra Keys (Keyboard Shortcut)

Tambahkan di `~/.termux/termux.properties`:

```properties
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
```

Lalu reload: `termux-reload-settings`

### Alt Key di Termux

Jika tombol `Alt` tidak ada di keyboard:
- Tekan `Esc` lalu huruf → sama dengan `Alt+huruf`
- Contoh: `Esc` lalu `a` = `Alt+a` (accept Minuet suggestion)

### Clipboard (Copy/Paste)

```bash
pkg install termux-api
```

Neovim akan bisa copy/paste ke clipboard Android.

### Font Rendering

Font JetBrainsMono Nerd Font sudah terinstall otomatis. Jika ikon tidak muncul, restart Termux.

---

## 🔧 Troubleshooting

### Plugin tidak terinstall

```vim
:Lazy sync
```

### CodeCompanion error "API key"

Pastikan sudah ganti `YOUR_OPENAI_API_KEY` dengan API key asli di:
```
~/.config/nvim/lua/plugins/codecompanion.lua
```

### Minuet tidak menampilkan saran

1. Pastikan sudah `:Minuet virtualtext enable`
2. Pastikan API key sudah diisi di `plugins/minuet.lua`
3. Pastikan ada koneksi internet

### Treesitter error saat install

```vim
:TSUpdate
```

### Theme tidak berubah

```vim
:Lazy sync
:colorscheme dracula
```

### LSP tidak jalan

Install language server yang dibutuhkan via Mason:
```vim
:Mason
```

Cari language server (misal `pyright` untuk Python, `lua_ls` untuk Lua), tekan `i` untuk install.

---

## 📁 Struktur File Plugin

```
~/.config/nvim/lua/plugins/
├── codecompanion.lua   # AI Chat & Agent
├── dracula.lua         # Theme Dracula
├── error-lens.lua      # Inline diagnostics
├── markmap.lua         # Mind map
├── markview.lua        # Markdown render
├── minuet.lua          # AI Autocomplete
├── noice-disable.lua   # Disable noice + notify
├── transparent.lua     # Background transparan
└── wakatime.lua        # Coding tracker
```

---

## 🔗 Link Berguna

| Resource | URL |
|----------|-----|
| LazyVim Docs | [lazyvim.github.io](https://www.lazyvim.org/) |
| Neovim Docs | [neovim.io/doc](https://neovim.io/doc/) |
| CodeCompanion | [github.com/olimorris/codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) |
| Minuet AI | [github.com/milanglacier/minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim) |
| Dracula Theme | [github.com/Mofiqul/dracula.nvim](https://github.com/Mofiqul/dracula.nvim) |
| OpenAI API Key | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) |
| Anthropic API Key | [console.anthropic.com](https://console.anthropic.com/) |
| WakaTime | [wakatime.com](https://wakatime.com) |

---

<p align="center">
  <b>Happy coding! 🚀</b>
</p>
