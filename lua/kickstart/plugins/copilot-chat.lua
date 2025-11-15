-- https://github.com/CopilotC-Nvim/CopilotChat.nvim?tab=readme-ov-file#lazynvim
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    cmd = "CopilotChat",
    keys = {
      -- { "<leader>at", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
    },
    config = function()
      -- https://github.com/CopilotC-Nvim/CopilotChat.nvim?tab=readme-ov-file#chat-key-mappings
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
    end,
  },
}
