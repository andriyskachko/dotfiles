-- TODO: fix (eslint errors on each write)
local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

lspconfig.tsserver.setup({})

null_ls.setup({
  on_attach = function(_, bufnr)
    local augroup = vim.api.nvim_create_augroup('null_format', {clear = true})
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      desc = 'Format',
      callback = function()
          if (pcall(vim.lsp.buf.format)) then
            return
          end
      end
    })
  end,
  sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = 'node_modules/.bin',
    })
  }
})
