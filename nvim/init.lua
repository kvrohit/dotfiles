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

require("packer").startup(function(use)
  use("wbthomason/packer.nvim") -- Package manager
  use("lewis6991/impatient.nvim") -- Speed up loading Lua modules in Neovim to improve startup time.
  use("tpope/vim-repeat") -- Enhanced dot repeat
  use("tpope/vim-surround") -- The quintessential surround plugin
  use("tpope/vim-fugitive") -- Git in nvim
  use("tpope/vim-sleuth") -- Autodetect indentation
  use("numToStr/Comment.nvim") -- Better comments
  use("lukas-reineke/indent-blankline.nvim") -- Indentation guides
  use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }) -- A snazzy bufferline
  use("akinsho/nvim-toggleterm.lua") -- Toggleterm
  use("max397574/better-escape.nvim") -- Better escape
  use("phaazon/hop.nvim") -- Hop
  use("famiu/feline.nvim") -- Statusline
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" } }) -- Telescope
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Git info in sign column
  use("nvim-treesitter/nvim-treesitter") -- Fast incremental parsing library
  use("nvim-treesitter/nvim-treesitter-textobjects") -- Additional text-objects for treesitter
  use("nvim-treesitter/nvim-treesitter-context") -- Context around editing
  use("neovim/nvim-lspconfig") -- Configurations for built-in LSP client
  use({ "williamboman/mason.nvim" }) -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
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
  use("/Users/rohit/play/neovim/substrata.nvim") -- Colorscheme
  use("kvrohit/tasks.nvim") -- Manage todo lists
  use("Olical/conjure") -- Interactive environment for evaluating code
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  })
  use("norcalli/nvim-colorizer.lua")
  use({
    "anuvyklack/hydra.nvim",
    requires = "anuvyklack/keymap-layer.nvim", -- needed only for pink hydras
  })
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })
  use({
    "nvim-neorg/neorg",
    requires = "nvim-lua/plenary.nvim",
  })
  use({ "lepture/vim-jinja" })
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

-- Neo-tree
require("neo-tree").setup()
vim.keymap.set("n", "\\", ":NeoTreeReveal<cr>")

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
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
})

-- Colorizer
require("colorizer").setup({
  "*",
  css = { rgb = true, rgb_fn = true },
  scss = { rgb = true, rgb_fn = true },
}, { names = false })

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

-- Null-ls
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.prettierd.with({
      extra_filetypes = { "astro" },
    }),
    require("null-ls").builtins.formatting.rustfmt,
    require("null-ls").builtins.formatting.cljstyle,
    require("null-ls").builtins.formatting.xmllint,
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.diagnostics.shellcheck,
    require("null-ls").builtins.diagnostics.yamllint,
  },
})
vim.keymap.set("n", "<leader><leader>s", function()
  vim.lsp.buf.formatting_sync(nil, 2000)
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
})

-- Hydra
local Hydra = require("hydra")

Hydra({
  name = "Side scroll",
  mode = "n",
  body = "z",
  heads = {
    { "h", "5zh" },
    { "l", "5zl", { desc = "←/→" } },
    { "H", "zH" },
    { "L", "zL", { desc = "half screen ←/→" } },
  },
})

local cmd = require("hydra.keymap-util").cmd
local pcmd = require("hydra.keymap-util").pcmd
local window_hint = [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally 
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
 _b_: choose buffer
]]

Hydra({
  name = "Windows",
  hint = window_hint,
  config = {
    invoke_on_body = true,
    hint = {
      border = "rounded",
      offset = -1,
    },
  },
  mode = "n",
  body = "<C-w>",
  heads = {
    { "h", "<C-w>h" },
    { "j", "<C-w>j" },
    { "k", pcmd("wincmd k", "E11", "close") },
    { "l", "<C-w>l" },

    { "H", cmd("WinShift left") },
    { "J", cmd("WinShift down") },
    { "K", cmd("WinShift up") },
    { "L", cmd("WinShift right") },

    { "=", "<C-w>=", { desc = "equalize" } },

    { "s", pcmd("split", "E36") },
    { "<C-s>", pcmd("split", "E36"), { desc = false } },
    { "v", pcmd("vsplit", "E36") },
    { "<C-v>", pcmd("vsplit", "E36"), { desc = false } },

    { "w", "<C-w>w", { exit = true, desc = false } },
    { "<C-w>", "<C-w>w", { exit = true, desc = false } },

    { "z", cmd("MaximizerToggle!"), { desc = "maximize" } },
    { "<C-z>", cmd("MaximizerToggle!"), { exit = true, desc = false } },

    { "o", "<C-w>o", { exit = true, desc = "remain only" } },
    { "<C-o>", "<C-w>o", { exit = true, desc = false } },

    { "c", pcmd("close", "E444") },
    { "q", pcmd("close", "E444"), { desc = "close window" } },
    { "<C-c>", pcmd("close", "E444"), { desc = false } },
    { "<C-q>", pcmd("close", "E444"), { desc = false } },

    { "<Esc>", nil, { exit = true, desc = false } },
  },
})

-- Which key
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    e = {
      name = "+eval",
      e = "Eval form",
      r = "Eval root form",
      w = "Eval word",
      ce = "Eval form & display result as a comment",
      cr = "Eval root form & display result as a comment",
      cw = "Eval word & display result as a comment",
      ["!"] = "Eval form & replace it with the result",
    },
    f = {
      name = "+file",
      f = "Find file",
      b = "Find buffer",
      g = "Grep string",
      s = "Document symbols",
      t = "Find tag",
      n = { "<cmd>enew<cr>", "New file" },
    },
    t = {
      name = "+task",
      t = "Create task/mark complete",
      c = "Cancel task",
      d = "Undo task",
    },
    s = "Save",
    d = {
      name = "+diagnostics",
      f = "Show diagnostics in popup",
      q = "All diagnostics to location list",
    },
    ["<leader>"] = {
      s = "Format and save",
    },
  },
  ["g"] = {
    D = "Go to declaration",
    d = "Go to definition",
    i = "Go to implementation",
    r = "Go to reference",
  },
})

-- Neorg
require("neorg").setup({
  load = {
    ["core.defaults"] = {},
  },
})

-- Bufferline
local bufferline = require("bufferline")
bufferline.setup({
  options = {
    numbers = "ordinal",
    always_show_bufferline = false,
    color_icons = false,
  },
})
vim.keymap.set("n", "<leader>1", function()
  bufferline.go_to_buffer(1, true)
end, { desc = "Go to buffer 1" })
vim.keymap.set("n", "<leader>2", function()
  bufferline.go_to_buffer(2, true)
end, { desc = "Go to buffer 2" })
vim.keymap.set("n", "<leader>3", function()
  bufferline.go_to_buffer(3, true)
end, { desc = "Go to buffer 3" })
vim.keymap.set("n", "<leader>4", function()
  bufferline.go_to_buffer(4, true)
end, { desc = "Go to buffer 4" })
vim.keymap.set("n", "<leader>5", function()
  bufferline.go_to_buffer(5, true)
end, { desc = "Go to buffer 5" })
vim.keymap.set("n", "<leader>6", function()
  bufferline.go_to_buffer(6, true)
end, { desc = "Go to buffer 6" })
vim.keymap.set("n", "<leader>7", function()
  bufferline.go_to_buffer(7, true)
end, { desc = "Go to buffer 7" })
vim.keymap.set("n", "<leader>8", function()
  bufferline.go_to_buffer(8, true)
end, { desc = "Go to buffer 8" })
vim.keymap.set("n", "<leader>9", function()
  bufferline.go_to_buffer(9, true)
end, { desc = "Go to buffer 9" })
vim.keymap.set("n", "<leader>$", function()
  bufferline.go_to_buffer(-1, true)
end, { desc = "Go to buffer -1" })

-- vim.g.rasmus_variant = "bright"

vim.cmd([[colorscheme rasmus]])
vim.cmd([[language en_US.utf-8]])
