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

local astro_group = vim.api.nvim_create_augroup("Astro", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" },
  { command = "setfiletype astro", group = astro_group, pattern = "*.astro" }
)

local plugins = {
  -- Package manager
  { "wbthomason/packer.nvim" },
  -- Speed up loading Lua modules in Neovim to improve startup time.
  { "lewis6991/impatient.nvim" },
  { "Yazeed1s/minimal.nvim" },
  { "sam4llis/nvim-tundra" },
  -- Enhanced dot repeat
  { "tpope/vim-repeat" },
  -- The quintessential surround plugin
  { "tpope/vim-surround" },
  -- Git in nvim
  { "tpope/vim-fugitive" },
  -- Autodetect indentation
  { "tpope/vim-sleuth" },
  -- Better comments
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  -- Indentation guides
  { "lukas-reineke/indent-blankline.nvim" },
  -- A snazzy bufferline
  {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.bufferline").setup()
    end,
  },
  -- Toggleterm
  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("config.toggleterm").setup()
    end,
  },
  -- Better escape
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- Hop
  {
    "phaazon/hop.nvim",
    config = function()
      require("config.hop").setup()
    end,
  },
  -- Statusline
  {
    "famiu/feline.nvim",
    config = function()
      require("config.statusline").setup()
    end,
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
    config = function()
      require("config.telescope").setup()
    end,
  },
  -- Git info in sign column
  {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  -- Fast incremental parsing library
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config.treesitter").setup()
    end,
  },
  -- Additional text-objects for treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  -- Context around editing
  { "nvim-treesitter/nvim-treesitter-context" },
  -- Configurations for built-in LSP client
  { "neovim/nvim-lspconfig" },
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  { "williamboman/mason.nvim" },
  -- Autocompletion plugin
  { "hrsh7th/nvim-cmp" },
  -- Completion source: LSP
  { "hrsh7th/cmp-nvim-lsp" },
  -- Completion source: buffer
  { "hrsh7th/cmp-buffer" },
  -- Completion source: path
  { "hrsh7th/cmp-path" },
  -- Completion source: LuaSnip
  { "saadparwaiz1/cmp_luasnip" },
  -- Snippets plugin
  { "L3MON4D3/LuaSnip" },
  -- Formatting and linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.null-ls").setup()
    end,
  },
  -- JSON schema definitions
  { "b0o/schemastore.nvim" },
  -- Show nice LSP status info
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  -- Tab out from parentheses, quotes, and similar contexts
  {
    "abecodes/tabout.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("tabout").setup()
    end,
  },
  -- Pair infer
  { "eraserhd/parinfer-rust", run = "cargo build --release" },
  -- Colorschemes
  { "/Users/rohit/play/neovim/rasmus.nvim" },
  { "/Users/rohit/play/neovim/substrata.nvim" },
  -- Manage todo lists
  { "kvrohit/tasks.nvim" },
  -- Interactive environment for evaluating code
  { "Olical/conjure" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("config.neotree").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("config.colorizer").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  },
}

require("packer").startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)

require("impatient")

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
vim.opt.timeoutlen = 500
vim.opt.background = "light"

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

-- Indent blankline
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_use_treesitter = true

-- Tasks
vim.keymap.set("n", "<leader>tt", require("task").toggle)
vim.keymap.set("n", "<leader>td", require("task").undo)
vim.keymap.set("n", "<leader>tc", require("task").cancel)

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist)

-- LSP
local servers = {
  "astro",
  "bashls",
  "clojure_lsp",
  "cssls",
  "html",
  "jdtls",
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

-- Mason
require("mason").setup()

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
local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "⌘",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "廓",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
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
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, vim_item)
      vim_item.menu = vim_item.kind
      vim_item.kind = icons[vim_item.kind]
      return vim_item
    end,
  },
})

-- vim.g.rasmus_variant = "bright"

vim.cmd([[colorscheme rasmus]])
vim.cmd([[language en_US.utf-8]])
