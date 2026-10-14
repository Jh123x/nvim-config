return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'LSP Go to definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
}
