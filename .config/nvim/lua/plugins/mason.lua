return {
  "williamboman/mason.nvim",
  build = ":MasonInstallAll",
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonUpdate")
      local ensure_installed = {
        "bash-language-server",
        "black",
        "clang-format",
        "clangd",
        "css-lsp",
        "dockerfile-language-server",
        "eslint-lsp",
        "html-lsp",
        "intelephense",
        "isort",
        "jq",
        "json-lsp",
        "jsonlint",
        "lua-language-server",
        "php-cs-fixer",
        "prettier",
        "prettierd",
        "python-lsp-server",
        "rust-analyzer",
        "shellcheck",
        "shellharden",
        "shfmt",
        "standardjs",
        "stylelint",
        "stylelint-lsp",
        "stylua",
        "tailwindcss-language-server",
        "terraform-ls",
        "tflint",
        "typescript-language-server",
        "prisma-language-server",
        "yaml-language-server",
        "yamlfmt",
        "yamllint",
      }
      vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
    end, { desc = "install all lsp tools" })
  end,
}
