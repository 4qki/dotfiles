return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "lua-language-server",
        "rust-analyzer",
        "shellcheck",
        "prettier",
        "zls",
        "clangd",
        "html-lsp",
        "css-lsp",
      })
    end,
  },
}
