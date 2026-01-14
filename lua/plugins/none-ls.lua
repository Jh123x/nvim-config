return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.stylua,
        null_ls.builtins.completion.spell,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    -- Define the autocommand group
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("NoneLsFormatting", { clear = true }),
      callback = function(opts)
        -- Check if a formatter is available for the current buffer and run it
        vim.lsp.buf.format({
          async = true,      -- Asynchronous formatting is generally preferred
          bufnr = opts.buf,
          timeout_ms = 1000, -- Adjust timeout as needed
        })
      end,
    })
  end,
}
