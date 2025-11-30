local codecompanion = require("codecompanion")
local codecompanion_adapters = require("codecompanion.adapters")

codecompanion.setup({
  strategies = {
    chat = { adapter = "gemini_cli" },
    inline = { adapter = "gemini_cli" },
  },
  adapters = {
    acp = {
      gemini_cli = function()
        return codecompanion_adapters.extend("gemini_cli", {
          defaults = {
            auth_method = "oauth-personal",
          },
        })
      end,
    },
  },
  display = {
    inline = {
      win = { layout = "float" },
    },
  },
  extensions = {
    history = {
      enabled = true,
      opts = {
        -- Keymap to open history from chat buffer (default: gh)
        keymap = "gh",
        -- Automatically generate titles for new chats
        auto_generate_title = true,
        ---On exiting and entering neovim, loads the last chat on opening chat
        continue_last_chat = false,
        ---When chat is cleared with `gx` delete the chat from history
        delete_on_clearing_chat = false,
        -- Picker interface ("telescope" or "snacks" or "default")
        picker = "telescope",
        ---Enable detailed logging for history extension
        enable_logging = false,
        ---Directory path to save the chats
        dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
        -- Save all chats by default
        auto_save = true,
        -- Keymap to save the current chat manually
        save_chat_keymap = "sc",
      },
    },
  },
})
