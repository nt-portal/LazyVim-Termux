# LazyVim Termux

<p align="center">
  <a href="https://github.com/nt-portal/LazyVim-Termux"><img src="https://img.shields.io/github/stars/nt-portal/LazyVim-Termux?style=for-the-badge&logo=github&color=2ea44f" alt="Stars"></a>
  <a href="https://github.com/nt-portal/LazyVim-Termux/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-GPLv3-blue?style=for-the-badge" alt="License"></a>
  <img src="https://img.shields.io/badge/Termux-000000?style=for-the-badge&logo=android&logoColor=white" alt="Termux">
  <img src="https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim">
  <img src="https://img.shields.io/badge/LazyVim-1a1a1a?style=for-the-badge" alt="LazyVim">
</p>

<p align="center">
  <b>LazyVim</b> yang sudah diracik khusus untuk <b>Termux</b> — one-liner install, backup aman, font & plugin siap pakai.
</p>

<p align="center">
  <img src="https://img.shields.io/github/last-commit/nt-portal/LazyVim-Termux?style=flat-square" alt="last commit">
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square" alt="PRs welcome">
  <img src="https://img.shields.io/badge/Android-Termux-3DDC84?style=flat-square&logo=android" alt="Android">
</p>

---

## 📦 Installation

```bash
curl -sL https://raw.githubusercontent.com/nt-portal/LazyVim-Termux/main/install.sh | bash
```

Yang dilakukan script:

1. Install dependency: `neovim` `nodejs` `yarn` `fd` `grep` `clang` `curl` `git`
2. Backup konfigurasi lama ke `.bak` (dilewati kalau belum ada)
3. Clone [LazyVim starter](https://github.com/LazyVim/starter)
4. Deploy konfigurasi plugin dari [`plugins/`](./plugins/) ke `~/.config/nvim/lua/plugins/`
5. Install JetBrainsMono Nerd Font
6. Buka Neovim — Lazy.nvim mengunduh plugin sisanya secara otomatis

<details>
<summary>Fork repo ini?</summary>

Ganti baris `REPO` di [install.sh](./install.sh) dengan username dan nama repo milikmu:

```bash
REPO="username/nama-repo"
```

</details>

---

## 🔑 Setup API Key

Repo ini **tidak menyimpan API key**. Semua key dibaca dari environment variable, jadi aman di-commit dan tidak hilang saat reinstall.

```bash
# Tambahkan ke ~/.bashrc
export OPENAI_API_KEY="sk-proj-xxxxxxxx"
```

Lalu reload shell: `source ~/.bashrc`.

Untuk memakai provider lain, lihat [docs/LEARN.md](./docs/LEARN.md#-ganti-provider-ai).

---

## ✨ Features

| | Detail |
|---|---|
| 🛡️ **Anti-blank** | `mkdir -p` untuk semua path, backup pakai `\|\| true` |
| 🧩 **Modular** | Semua plugin terpisah di [`plugins/`](./plugins/) — mudah dibaca |
| 🔑 **Aman** | API key lewat environment variable, nol secret di repo |
| 🎨 **Dracula** | Tema gelap + background transparan |
| 🤖 **AI siap pakai** | CodeCompanion (chat & agent) + Minuet (ghost text) |
| 🔤 **Font** | JetBrainsMono Nerd Font via [`assest/font.ttf`](./assest/font.ttf) |
| ⚡ **Performa** | `noice.nvim` + `nvim-notify` dimatikan untuk hemat RAM |
| ⚡ **Navigasi** | Oil, Harpoon, Flash untuk berpindah file dan posisi cepat |

---

## 🔌 Plugins

### AI

| Plugin | Fungsi |
|---|---|
| [olimorris/codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) | AI chat, inline edit, agent mode |
| [milanglacier/minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim) | Ghost text / AI autocomplete |

### Navigasi & File

| Plugin | Fungsi |
|---|---|
| [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim) | File manager di dalam buffer |
| [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) | Bookmark & lompat antar file |
| [folke/flash.nvim](https://github.com/folke/flash.nvim) | Lompat ke posisi kode dengan 2 tombol |
| [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim) | Outline fungsi/class di sidebar |

### Edit & Refactor

| Plugin | Fungsi |
|---|---|
| [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) | Bungkus teks dengan (), [], "" |
| [monaqa/dial.nvim](https://github.com/monaqa/dial.nvim) | Tambah/kurangi angka, tanggal, boolean |
| [gbprod/yanky.nvim](https://github.com/gbprod/yanky.nvim) | Clipboard history & paste siklus |
| [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | Search & replace seluruh project |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Sorot & cari TODO, FIXME, HACK |

### Task & Session

| Plugin | Fungsi |
|---|---|
| [stevearc/overseer.nvim](https://github.com/stevearc/overseer.nvim) | Jalankan task: build, test, lint |
| [folke/persistence.nvim](https://github.com/folke/persistence.nvim) | Simpan & pulihkan session kerja |

### Tampilan

| Plugin | Fungsi |
|---|---|
| [Mofiqul/dracula.nvim](https://github.com/Mofiqul/dracula.nvim) | Tema Dracula |
| [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim) | Background transparan |
| [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Render Markdown di buffer |
| [Zeioth/markmap.nvim](https://github.com/Zeioth/markmap.nvim) | Mind map dari Markdown |
| [chikko80/error-lens.nvim](https://github.com/chikko80/error-lens.nvim) | Diagnostic inline |
| [wakatime/vim-wakatime](https://github.com/wakatime/vim-wakatime) | Pelacak waktu coding |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | ❌ Dinonaktifkan |

---

## 📖 Dokumentasi

Panduan lengkap — keybinding, ganti provider AI, tips Termux, troubleshooting:

**👉 [docs/LEARN.md](./docs/LEARN.md)**

---

## 📁 Struktur Repo

```
LazyVim-Termux/
├── install.sh        # Installer satu baris
├── plugins/          # Konfigurasi plugin, di-deploy ke ~/.config/nvim/lua/plugins/
├── docs/LEARN.md     # Dokumentasi lengkap
└── assest/font.ttf   # JetBrainsMono Nerd Font
```

---

## 📄 License

[GPL-3.0](./LICENSE)

---

<p align="center">
  <a href="https://saweria.co/ntdonate"><img src="https://img.shields.io/badge/Donate-Saweria-orange?style=for-the-badge&logo=heart" alt="Donate"></a>
</p>