-- Tab formats
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set leader
vim.g.mapleader = " "

-- Line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

-- Enable virtual warnings/errors
vim.diagnostic.config({ virtual_text = true })

-- Autocommand to format on save using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
  callback = function(args)
    vim.lsp.buf.format({ async = false, bufnr = args.buf })
  end,
})

-- Add copy to clipboard
vim.o.clipboard = "unnamedplus"

-- Add Go file formats
vim.filetype.add({
  extension = {
    tmpl = 'gotmpl',
  },
})

-- Other native bindings
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic location list' })
