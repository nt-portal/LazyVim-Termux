-- Minuet — ghost text / AI autocomplete saat mengetik di Insert mode.
--
-- API key dibaca dari environment variable, bukan ditulis di file ini.
-- Provider bawaan adalah OpenAI. Lihat docs/LEARN.md untuk setup lengkapnya.

return {
  {
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    opts = {
      -- Pilihan: "openai", "claude", "openai_compatible"
      provider = "openai",

      virtualtext = {
        -- Kosongkan agar saran hanya muncul saat dipanggil manual.
        -- Contoh auto trigger semua bahasa: { "*" }
        auto_trigger_ft = {},
        keymap = {
          accept = "<A-A>", -- terima seluruh saran
          accept_line = "<A-a>", -- terima satu baris
          dismiss = "<A-e>", -- buang saran
          next = "<A-]>", -- saran berikutnya
          prev = "<A-[>", -- saran sebelumnya
        },
      },

      throttle = 2000,
      debounce = 600,
      request_timeout = 5,

      provider_options = {
        -- OpenAI — aktif secara default
        openai = {
          model = "gpt-4o-mini",
          api_key = "OPENAI_API_KEY",
          optional = {
            max_tokens = 128,
          },
        },

        -- Untuk Claude dan 9Router, ganti baris provider di atas menjadi
        -- "claude" atau "openai_compatible", lalu batalkan komentar blok terkait.

        -- Claude
        -- claude = {
        --   model = "claude-haiku-4.5",
        --   end_point = "https://api.anthropic.com/v1/messages",
        --   api_key = "ANTHROPIC_API_KEY",
        --   stream = true,
        --   optional = {
        --     max_tokens = 128,
        --   },
        -- },

        -- 9Router — lokal
        -- openai_compatible = {
        --   name = "9router",
        --   end_point = "http://localhost:20128/v1/chat/completions",
        --   model = "VibeCodes",
        --   api_key = "NINEROUTER_API_KEY",
        --   stream = true,
        --   optional = {
        --     max_tokens = 128,
        --   },
        -- },
      },
    },
  },
}