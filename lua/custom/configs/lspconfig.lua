local base = require("plugins.configs.lspconfig")

local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

-- C/C++ lspconfig
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = {"clangd"},
})

-- Python lspconfig
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

-- WebDev lspconfig
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

