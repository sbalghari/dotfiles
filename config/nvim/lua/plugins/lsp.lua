return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          enabled = false,
        },
        ty = {},
        clangd = {},
        ruff = {},
        rust_analyzer = {},
      },
    },
  },

}
