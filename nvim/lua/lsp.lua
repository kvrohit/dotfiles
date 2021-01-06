vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
    }
)

local config = require('lspconfig')
config.rust_analyzer.setup {}
config.bashls.setup {}
config.html.setup {}
config.cssls.setup {}
