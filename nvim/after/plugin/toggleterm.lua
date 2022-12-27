require("toggleterm").setup({
  open_mapping = [[<F12>]],
  direction = "float",
  float_opts = {
    border = "single",
    winblend = 3,
    -- highlights = {
    --   border = "Normal",
    --   background = "Normal",
    -- },
  },
})
local Terminal = require("toggleterm.terminal").Terminal
local xplr_temp_path = "/tmp/xplr_temp_file"
local id = vim.api.nvim_get_current_win()
local xplr = Terminal:new({
  cmd = "xplr > " .. xplr_temp_path,
  hidden = true,
  direction = "float",
  float_opts = { border = "none" },
  on_close = function(term)
    for line in io.lines(xplr_temp_path) do
      local cmd = "edit " .. vim.fn.fnameescape(line)
      vim.api.nvim_set_current_win(id)
      pcall(vim.cmd, cmd)
    end
    os.remove(xplr_temp_path)
  end,
})

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", float_opts = { border = "none" } })
function _lazygit_toggle()
  lazygit:toggle()
end

function _toggle_xplr()
  xplr:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua _lazygit_toggle()<cr>", { desc = "Lazygit", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>lua _toggle_xplr()<cr>", { desc = "xplr", noremap = true, silent = true })
