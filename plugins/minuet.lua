return {
  {
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    opts = {
      -- Provider aktif: "openai" / "openai_compatible"
      -- Ganti ke "openai_compatible" untuk pakai Anthropic atau 9Router
      provider = "openai",
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          accept = "<A-a>",
          accept_line = "<A-l>",
          dismiss = "<A-e>",
          next = "<A-n>",
          prev = "<A-p>",
        },
      },
      throttle = 2000,
      debounce = 600,
      request_timeout = 5,
      provider_options = {
        -- OpenAI (aktif)
        openai = {
          model = "gpt-4o-mini",
          api_key = "YOUR_OPENAI_API_KEY",
          optional = {
            max_tokens = 128,
          },
        },

        -- Untuk Anthropic / 9Router, ganti provider = "openai_compatible"
        -- lalu uncomment salah satu blok di bawah:

        -- Anthropic
        -- openai_compatible = {
        --   name = "anthropic",
        --   end_point = "https://api.anthropic.com/v1/chat/completions",
        --   model = "claude-sonnet-4-20250514",
        --   api_key = function()
        --     return "YOUR_ANTHROPIC_API_KEY"
        --   end,
        --   stream = true,
        --   optional = {
        --     max_tokens = 128,
        --   },
        -- },

        -- 9Router
        -- openai_compatible = {
        --   name = "9router",
        --   end_point = "http://localhost:20128/v1/chat/completions",
        --   model = "VibeCodes",
        --   api_key = function()
        --     return "YOUR_9ROUTER_API_KEY"
        --   end,
        --   stream = true,
        --   optional = {
        --     max_tokens = 128,
        --   },
        -- },
      },
    },
  },
}
