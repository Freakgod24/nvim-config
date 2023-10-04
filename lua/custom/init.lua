local opt = vim.opt

opt.expandtab = true
opt.shiftwidth= 4
opt.tabstop = 4

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    severity_limit = "Error"
  }
)
