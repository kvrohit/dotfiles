-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" }
)

require("packer").startup(function(use)
  use("wbthomason/packer.nvim") -- Package manager
  use("tpope/vim-repeat") -- Enhanced dot repeat
  use("tpope/vim-surround") -- The quintessential surround plugin
  use("tpope/vim-fugitive") -- Git in nvim
  use("tpope/vim-sleuth") -- Autodetect indentation
  use("numToStr/Comment.nvim") -- Better comments
  use("lukas-reineke/indent-blankline.nvim") -- Indentation guides
  use("jose-elias-alvarez/buftabline.nvim") -- Buffers in tabline
  use("akinsho/nvim-toggleterm.lua") -- Toggleterm
  use("max397574/better-escape.nvim") -- Better escape
  use("phaazon/hop.nvim") -- Hop
  use("famiu/feline.nvim") -- Statusline
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" } }) -- Telescope
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Git info in sign column
  use("nvim-treesitter/nvim-treesitter") -- Fast incremental parsing library
  use("nvim-treesitter/nvim-treesitter-textobjects") -- Additional text-objects for treesitter
  use("neovim/nvim-lspconfig") -- Configurations for built-in LSP client
  use("williamboman/nvim-lsp-installer") -- Installer for language servers
  use("hrsh7th/nvim-cmp") -- Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp") -- Completion source: LSP
  use("hrsh7th/cmp-buffer") -- Completion source: buffer
  use("hrsh7th/cmp-path") -- Completion source: path
  use("saadparwaiz1/cmp_luasnip") -- Completion source: LuaSnip
  use("L3MON4D3/LuaSnip") -- Snippets plugin
  use("jose-elias-alvarez/null-ls.nvim") -- Formatting and linting
  use("b0o/schemastore.nvim") -- JSON schema definitions
  use("j-hui/fidget.nvim") -- Show nice status info
  use("windwp/nvim-autopairs") -- Auto pairs
  use({ "abecodes/tabout.nvim", requires = { "nvim-treesitter/nvim-treesitter" } }) -- Tab out from parentheses, quotes, and similar contexts
  use({ "eraserhd/parinfer-rust", run = "cargo build --release" }) -- Pair infer
  use("/Users/rohit/play/neovim/rasmus.nvim") -- Colorscheme
  use("kvrohit/tasks.nvim") -- Manage todo lists
  use("Olical/conjure") -- Interactive environment for evaluating code
end)

vim.opt.laststatus = 3
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showmode = false
vim.opt.wrap = false

-- Remap space as leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>s", "<cmd>w<cr>")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Better escape
require("better_escape").setup()

-- Buftabline
require("buftabline").setup({
  tab_format = " #{n}> #{b} ",
  icon_colors = false,
  hlgroups = {
    modified_current = "VisualMode",
    modified_normal = "Warnings",
    modified_active = "VisualMode",
  },
})

-- Comment
require("Comment").setup()

-- Indent blankline
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_use_treesitter = true

-- Hop
local hop = require("hop")
local hop_hint = require("hop.hint")
hop.setup()
vim.keymap.set("n", "f", function()
  hop.hint_char1({ direction = hop_hint.HintDirection.AFTER_CURSOR, current_line_only = true })
end)
vim.keymap.set("n", "F", function()
  hop.hint_char1({ direction = hop_hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
end)
vim.keymap.set("o", "f", function()
  hop.hint_char1({ direction = hop_hint.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })
end)
vim.keymap.set("o", "F", function()
  hop.hint_char1({ direction = hop_hint.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })
end)

-- Tasks
vim.keymap.set("n", "<leader>tt", require("task").toggle)
vim.keymap.set("n", "<leader>td", require("task").undo)
vim.keymap.set("n", "<leader>tc", require("task").cancel)

-- Telescope
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
vim.keymap.set("n", "<leader>ff", function()
  local ok = pcall(require("telescope.builtin").git_files)
  if not ok then
    require("telescope.builtin").find_files()
  end
end)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>ft", require("telescope.builtin").tags)
vim.keymap.set("n", "<leader>fg", function()
  vim.ui.input({ prompt = "Enter search term > " }, function(value)
    require("telescope.builtin").grep_string({ search = value })
  end)
end)

-- Git signs
require("gitsigns").setup()

-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true },
  autotag = { enable = true },
  indent = { enable = true },
})

-- Toggleterm
require("toggleterm").setup({
  open_mapping = [[<F12>]],
  direction = "float",
  float_opts = {
    border = "single",
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- LSP
local servers = {
  "bashls",
  "clojure_lsp",
  "cssls",
  "html",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "tsserver",
  "yamlls",
}
-- Additional server settings
local server_settings = {
  ["jsonls"] = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
  ["sumneko_lua"] = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
require("nvim-lsp-installer").setup({
  ensure_installed = servers,
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols, opts)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
  -- Prefer null-ls for formatting
  client.resolved_capabilities.document_formatting = false
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server_settings[lsp] then
    opts.settings = server_settings[lsp]
  end

  require("lspconfig")[lsp].setup(opts)
end

-- LuaSnip
local luasnip = require("luasnip")

-- Autocompletion
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer", keyword_length = 4 },
  },
  experimental = {
    ghost_text = true,
  },
})

-- Null-ls
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.prettier,
    require("null-ls").builtins.formatting.rustfmt,
    require("null-ls").builtins.formatting.cljstyle,
    require("null-ls").builtins.formatting.xmllint,
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.diagnostics.shellcheck,
  },
})
vim.keymap.set("n", "<leader><leader>s", function()
  vim.lsp.buf.formatting_sync()
  vim.cmd([[w]])
end)

-- Auto pairs
require("nvim-autopairs").setup()

-- Tabout
require("tabout").setup()

-- Fidget
require("fidget").setup()

-- Statusline
local mode_colors = {
  n = "StatusLineNormalMode",
  no = "StatusLineNormalMode",
  i = "StatusLineInsertMode",
  v = "StatusLineVisualMode",
  V = "StatusLineVisualMode",
  [""] = "StatusLine",
  r = "StatusLineReplaceMode",
  rm = "StatusLineReplaceMode",
  R = "StatusLineReplaceMode",
  Rv = "StatusLineReplaceMode",
  s = "StatusLineVisualMode",
  S = "StatusLineVisualMode",
  c = "StatusLineTerminalMode",
  ["!"] = "StatusLineReplaceMode",
  t = "StatusLineTerminalMode",
}
require("feline").setup({
  components = {
    active = {
      -- left
      {
        {
          provider = " ",
          hl = function()
            return mode_colors[vim.fn.mode()]
          end,
          right_sep = { str = " ", hl = "StatusLine" },
        },
        {
          provider = "git_branch",
          hl = "StatusLine",
        },
        {
          provider = "",
          hl = "StatusLine",
        },
      },
      -- center
      {},
      -- right
      {
        {
          provider = "diagnostic_errors",
          hl = "StatusLineError",
        },
        {
          provider = "diagnostic_warnings",
          hl = "StatusLineWarn",
        },
        {
          provider = "diagnostic_hints",
          hl = "StatusLineHint",
        },
        {
          provider = "diagnostic_info",
          hl = "StatusLineInfo",
        },
        {
          provider = "lsp_client_names",
          hl = "StatusLineNC",
          icon = " ",
          left_sep = { str = "  ", hl = "StatusLine" },
        },
        {
          provider = {
            name = "file_info",
            opts = {
              file_modified_icon = "",
              colored_icon = false,
            },
          },
          hl = "StatusLine",
          left_sep = { str = "  ", hl = "StatusLine" },
          right_sep = { str = " ", hl = "StatusLine" },
        },
        {
          provider = " ",
          hl = function()
            return mode_colors[vim.fn.mode()]
          end,
        },
      },
    },
    inactive = {
      {
        {
          provider = "",
          hl = {
            bg = "StatusLine",
            fg = "black",
            style = "underline",
          },
        },
      },
    },
  },
  disable = {
    filetypes = {
      "neo-tree",
    },
  },
})

vim.cmd([[colorscheme rasmus]])
vim.cmd([[language en_US.utf-8]])
