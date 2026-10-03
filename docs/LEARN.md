# 📖 LEARN — Panduan Lengkap LazyVim Termux

Selamat datang! Jika kamu baru pertama kali menggunakan Neovim, jangan panik. File ini akan membimbingmu dari nol hingga mahir menggunakan fitur AI dan navigasi cepat.

---

## 📑 Daftar Isi
1. [Istilah Penting (Kamus Neovim)](#-istilah-penting-kamus-neovim)
2. [Memahami Mode Neovim](#-memahami-mode-neovim)
3. [Instalasi & Persiapan](#-instalasi--persiapan)
4. [Navigasi Dasar & Shortcut](#-navigasi-dasar--shortcut)
5. [Menggunakan AI (CodeCompanion & Minuet)](#-menggunakan-ai-codecompanion--minuet)
6. [Fitur Navigasi Cepat (Oil, Harpoon, Flash)](#-fitur-navigasi-cepat)
7. [Fitur Editing (Surround, Dial, Yanky)](#-fitur-editing)
8. [Tips Termux & Troubleshooting](#-tips-termux--troubleshooting)

---

## 📖 Istilah Penting (Kamus Neovim)
Sebelum lanjut, pahami istilah-istilah ini:
- **Leader Key**: Tombol utama untuk memicu shortcut. Di repo ini, Leader Key adalah **`Space`** (Spasi).
- **Buffer**: File yang sedang dibuka. Kamu bisa punya banyak buffer terbuka sekaligus.
- **LSP (Language Server Protocol)**: Otak di balik Neovim. Ini yang memberikan fitur *Auto-complete*, *Go to Definition*, dan deteksi error kode.
- **Treesitter**: Fitur yang membuat warna kode (syntax highlighting) jadi sangat cantik dan akurat.
- **Lazy.nvim**: Manager plugin yang bertugas mengunduh dan mengatur semua fitur tambahan.

---

## 🕹 Memahami Mode Neovim
Berbeda dengan Notepad atau Word, Neovim memiliki "Mode":

1.  **Normal Mode (Tekan `Esc`)**: Mode default. Di sini tombol keyboard digunakan untuk **navigasi**, bukan mengetik. (Contoh: `d` untuk hapus, bukan mengetik huruf 'd').
2.  **Insert Mode (Tekan `i`)**: Mode untuk **mengetik** seperti biasa.
3.  **Visual Mode (Tekan `v`)**: Mode untuk **memblok/seleksi** teks.
4.  **Command Mode (Tekan `:`)**: Mode untuk mengetik perintah di bagian bawah (seperti `:w` untuk simpan).

---

## 📦 Instalasi & Persiapan

### 1. Instalasi
Jalankan perintah ini di Termux:
```bash
curl -sL https://raw.githubusercontent.com/nt-portal/LazyVim-Termux/main/install.sh | bash
```

### 2. Setup API Key (WAJIB)
AI tidak akan jalan tanpa API Key. Kita menggunakan **Environment Variables** agar aman.
- Buka file bash: `nano ~/.bashrc`
- Tambahkan baris ini di paling bawah (ganti dengan key asli kamu):
  ```bash
  export OPENAI_API_KEY="sk-proj-xxxxxxxx"
  ```
- Simpan (`Ctrl+O`, `Enter`) dan Keluar (`Ctrl+X`).
- Terapkan: `source ~/.bashrc`

---

## ⌨️ Navigasi Dasar & Shortcut

### Navigasi Tanpa Mouse
Gunakan tombol ini di **Normal Mode**:
- `h` (kiri), `j` (bawah), `k` (atas), `l` (kanan).
- `w`: Lompat ke awal kata berikutnya.
- `b`: Lompat ke awal kata sebelumnya.
- `gg`: Ke paling atas file.
- `G`: Ke paling bawah file.

### Shortcut Penting (Leader = `Space`)
| Shortcut | Fungsi |
|----------|--------|
| `Space f f` | Cari file di dalam folder (Telescope) |
| `Space e` | Buka daftar file di samping (Neo-tree) |
| `Space b b` | Lihat daftar file yang sedang dibuka |
| `Space /` | Cari kata di seluruh file (Grep) |
| `Space l` | Buka menu Lazy (cek update plugin) |
| `u` | Undo (batal) |
| `Ctrl + r` | Redo (ulangi) |
| `:w` | Simpan file |
| `:q` | Keluar |

---

## 🤖 Menggunakan AI (CodeCompanion & Minuet)

### 1. CodeCompanion (Chat & Agent)
Ini seperti memiliki ChatGPT/Claude di dalam editor.
- **Chat**: Ketik `:CodeCompanionChat` untuk buka jendela chat.
- **Agent Mode**: Di dalam chat, ketik `/Agent` agar AI bisa membantu mengedit file atau menjalankan command otomatis.
- **Inline Edit**: Blok kode di Visual Mode, lalu ketik `:CodeCompanion buatkan fungsi ini jadi efisien`.

### 2. Minuet AI (Autocomplete)
Ini memberikan "Ghost Text" (saran kode transparan) saat kamu mengetik.
- **Cara Aktifkan**: Ketik `:Minuet virtualtext enable`.
- **Cara Pakai**:
  - `Alt + Shift + A`: Ambil semua saran.
  - `Alt + a`: Ambil satu baris saja.
  - `Alt + e`: Tolak saran.

---

## ⚡ Fitur Navigasi Cepat

### Oil (File Manager Rasa Buffer)
**Kenapa?** Kadang Neo-tree terlalu sempit di HP. Oil membuat daftar file tampil seperti teks biasa.
- Tekan `-` (kurang) untuk buka Oil.
- Kamu bisa hapus baris di Oil untuk menghapus file tersebut!

### Harpoon (Lompat Antar File)
**Kenapa?** Jika kamu mengerjakan 3 file, bolak-balik cari file itu melelahkan.
- `Space ha`: "Tandai" file ini.
- `Space 1`, `Space 2`: Lompat ke file yang sudah ditandai.

### Flash (Lompat Lokasi)
**Kenapa?** Ingin ke kata "function" di tengah layar?
- Tekan `s`, lalu ketik `fu`. Muncul huruf-huruf kecil di layar, tekan huruf itu untuk langsung mendarat di sana.

---

## 🎯 Fitur Editing

### Surround (Bungkus Teks)
- Ketik `ysiw"` di atas sebuah kata untuk membungkusnya dengan `"tanda kutip"`.
- Ketik `ds"` untuk menghapus tanda kutip tersebut.

### Dial (Tambah/Kurangi Nilai)
- Arahkan kursor ke angka `10`, tekan `Ctrl + a` → jadi `11`.
- Bisa juga untuk tanggal, hex color, dan `true`/`false`.

---

## 💡 Tips Termux & Troubleshooting

### Clipboard (Copy-Paste ke Android)
Agar bisa copy dari Neovim ke WhatsApp/Browser Android:
1. Install tool: `pkg install termux-api`
2. Restart Termux.
3. Sekarang, apapun yang kamu `y` (yank) di Neovim bisa di-paste di aplikasi luar.

### Masalah Layar HP Kecil
Jika baris kode terlalu panjang, aktifkan wrap:
- Ketik `:set wrap`

### Plugin Stuck / Tidak Muncul
1. Jalankan `:Lazy sync` untuk memaksa update.
2. Cek koneksi internet.
3. Untuk AI, pastikan `echo $OPENAI_API_KEY` di Termux menampilkan key kamu.

---

## 📁 Struktur File Konfigurasi
Jika ingin mengutak-atik:
- `~/.config/nvim/lua/plugins/`: Tempat semua file konfigurasi plugin berada.
- `~/.config/nvim/lua/config/keymaps.lua`: Tempat jika kamu ingin membuat shortcut sendiri.

---
<p align="center">
  <b>Semangat Belajar! Jangan takut mencoba. 🚀</b>
</p>
