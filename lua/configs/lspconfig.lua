-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "rust_analyzer", "wgsl_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

local DEFAULT_FQBN = "arduino:avr:nano"
local fqbn = DEFAULT_FQBN

lspconfig.arduino_language_server.setup {
  cmd = {
      "arduino-language-server",
      "-cli-config", "/home/hvlife/.arduino15/arduino-cli.yaml",
      "-fqbn",
      fqbn
  },

  on_attach = on_attach,
  on_init = on_init,
  --capabilities = capabilities,
}
