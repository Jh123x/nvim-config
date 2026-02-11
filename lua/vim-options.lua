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
