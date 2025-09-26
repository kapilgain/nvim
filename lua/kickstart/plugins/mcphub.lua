-- https://ravitemer.github.io/mcphub.nvim/installation.html#local-installation
return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "bundled_build.lua", -- Bundles `mcp-hub` binary along with the neovim plugin
    config = function()
      require("mcphub").setup({
        use_bundled_binary = true, -- Use local `mcp-hub` binary
      })

      -- https://ravitemer.github.io/mcphub.nvim/extensions/avante.html#add-tools-to-avante
      require("avante").setup({
        -- system_prompt as function ensures LLM always has latest MCP server state
        -- This is evaluated for every message, even in existing chats
        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub and hub:get_active_servers_prompt() or ""
        end,
        -- Using function prevents requiring mcphub before it's loaded
        custom_tools = function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end,
      })

      -- https://ravitemer.github.io/mcphub.nvim/extensions/avante.html#configure-avante-integration
      require("mcphub").setup({
        extensions = {
          avante = {
            make_slash_commands = true, -- make /slash commands from MCP server prompts
          },
        },
      })
    end,
  },
}
