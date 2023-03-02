return {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  ft = "markdown",
  keys = {
    {
      "<leader>op",
      function()
        local peek = require("peek")
        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end,
      desc = "Peek (Markdown Preview)",
    },
  },
  opts = {
    theme = "light", -- 'dark' or 'light'
  },
}
