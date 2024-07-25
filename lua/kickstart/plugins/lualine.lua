return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sections = {
      lualine_x = {
        function()
          local linters = require("lint").get_running()
          if #linters == 0 then
            return "󰦕"
          end
          return "󱉶 " .. table.concat(linters, ", ")
        end,
        "encoding",
        "fileformat",
        "filetype",
      },
    },
  },
}
