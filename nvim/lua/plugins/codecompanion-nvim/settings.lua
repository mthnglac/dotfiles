require("codecompanion").setup({
  adapters = {
    opts = {
      show_model_choices = true,
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
