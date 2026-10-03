-- CodeCompanion — AI chat, inline edits, dan agent mode di dalam Neovim.
--
-- API key dibaca dari environment variable, bukan ditulis di file ini.
-- Lihat docs/LEARN.md untuk setup lengkapnya.

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      interactions = {
        chat = {
          adapter = "openai",
          -- adapter = "anthropic",
          -- adapter = "9router",
        },
        inline = {
          adapter = "openai",
          -- adapter = "anthropic",
          -- adapter = "9router",
        },
      },
      adapters = {
        http = {
          -- OpenAI — aktif secara default
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              env = {
                api_key = "OPENAI_API_KEY",
              },
              schema = {
                model = {
                  default = "gpt-4o",
                },
              },
            })
          end,

          -- Anthropic — aktifkan dengan membatalkan komentar adapter "anthropic" di atas
          -- anthropic = function()
          --   return require("codecompanion.adapters").extend("anthropic", {
          --     env = {
          --       api_key = "ANTHROPIC_API_KEY",
          --     },
          --     schema = {
          --       model = {
          --         default = "claude-sonnet-4-20250514",
          --       },
          --     },
          --   })
          -- end,

          -- 9Router — lokal, aktifkan dengan membatalkan komentar adapter "9router" di atas
          -- ["9router"] = function()
          --   return require("codecompanion.adapters").extend("openai_compatible", {
          --     env = {
          --       url = "http://localhost:20128",
          --       chat_url = "/v1/chat/completions",
          --       api_key = "NINEROUTER_API_KEY",
          --     },
          --     schema = {
          --       model = {
          --         default = "VibeCodes",
          --       },
          --     },
          --   })
          -- end,
        },
      },
    },
  },
}