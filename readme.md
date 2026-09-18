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

> Script otomatis: `pkg install` deps, `mkdir -p` semua path (anti-blank), backup skip-jika-tidak-ada, deploy `plugins/` modular.

## ✨ Features

| | Detail |
|---|---|
| 🛡️ **Anti-blank** | `mkdir -p ~/.config ~/.termux ~/.cache` + backup `|| true` |
| 🧩 **Modular** | Semua plugin terpisah di [`plugins/`](./plugins/) — mudah dibaca |
| 🔤 **Font** | JetBrainsMono Nerd Font via `assest/font.ttf` |
| ⚡ **Performa** | `noice.nvim` + `nvim-notify` dimatikan |
| 🔧 **Deps lengkap** | `neovim` `nodejs` `yarn` `fd` `grep` `clang` `curl` `git` |

## 🔌 Plugins

| Plugin | Status |
|---|---|
| [wakatime/vim-wakatime](https://github.com/wakatime/vim-wakatime) | ✅ |
| [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim) | ✅ |
| [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim) | ✅ |
| [Zeioth/markmap.nvim](https://github.com/Zeioth/markmap.nvim) | `Markmap*` cmds |
| [olimorris/codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) | Gemini adapter |
| [chikko80/error-lens.nvim](https://github.com/chikko80/error-lens.nvim) | `LspAttach` |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | ❌ disabled |

---

<p align="center">
  <a href="https://saweria.co/ntdonate"><img src="https://img.shields.io/badge/Donate-Saweria-orange?style=for-the-badge&logo=heart" alt="Donate"></a>
</p>
