local M = {}

local prettier_formatter = function()
  return {
    exe = "prettier",
    args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
    stdin = true,
  }
end

local rust_formatter = function()
  return {
    exe = "rustfmt",
    args = { "--emit=stdout" },
    stdin = true,
  }
end

local lua_formatter = function()
  return {
    exe = "stylua",
    args = { "--config-path " .. os.getenv("HOME") .. "/.config/stylua/stylua.toml", "-" },
    stdin = true,
  }
end

local python_formatter = function()
  return {
    exe = "black",
    args = { "-" },
    stdin = true,
  }
end

M.setup = function()
  require("formatter").setup({
    logging = false,
    filetype = {
      javascript = {
        prettier_formatter,
      },
      javascriptreact = {
        prettier_formatter,
      },
      json = {
        prettier_formatter,
      },
      html = {
        prettier_formatter,
      },
      css = {
        prettier_formatter,
      },
      scss = {
        prettier_formatter,
      },
      markdown = {
        prettier_formatter,
      },
      yaml = {
        prettier_formatter,
      },
      rust = {
        rust_formatter,
      },
      lua = {
        lua_formatter,
      },
      python = {
        python_formatter,
      },
    },
  })
end

return M
