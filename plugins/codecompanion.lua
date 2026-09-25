return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
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
        -- OpenAI (aktif)
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = "YOUR_OPENAI_API_KEY",
            },
            schema = {
              model = {
                default = "gpt-4o",
              },
            },
          })
        end,

        -- Anthropic (uncomment adapter di atas & blok ini untuk pakai)
        -- anthropic = function()
        --   return require("codecompanion.adapters").extend("anthropic", {
        --     env = {
        --       api_key = "YOUR_ANTHROPIC_API_KEY",
        --     },
        --     schema = {
        --       model = {
        --         default = "claude-sonnet-4-20250514",
        --       },
        --     },
        --   })
        -- end,

        -- 9Router (uncomment adapter di atas & blok ini untuk pakai)
        -- ["9router"] = function()
        --   return require("codecompanion.adapters").extend("openai", {
        --     env = {
        --       url = "http://localhost:20128/v1",
        --       api_key = "YOUR_9ROUTER_API_KEY",
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
}
