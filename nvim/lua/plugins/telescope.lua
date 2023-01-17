local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
}

local function project_files()
  local opts = {}
  if vim.loop.fs_stat(".git") then
    opts.show_untracked = true
    require("telescope.builtin").git_files(opts)
  else
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require("telescope.builtin").find_files(opts)
  end
end

local function live_grep()
  require("telescope.builtin").live_grep({})
end

local function diagnostics()
  require("telescope.builtin").diagnostics({})
end

local function buffers()
  require("telescope.builtin").buffers({})
end

M.dependencies = {
  { "nvim-lua/plenary.nvim" },
}

M.keys = {
  { "<leader>f", project_files, desc = "Open file picker" },
  { "<leader>/", live_grep, desc = "Global search" },
  { "<leader>d", diagnostics, desc = "Open diagnostic picker" },
  { "<leader>b", buffers, desc = "Open buffer picker" },
}

M.config = function()
  require("telescope").setup({
  defaults = {
    mappings = {
      i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
    },
  })
end

return M
