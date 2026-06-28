return {
  {
    "LazyVim/LazyVim",
    opts = {
      root_spec = {
        "lsp",
        { ".git", "lua", "Cargo.toml", "pyproject.toml", "CMakeLists.txt", "compile_commands.json" },
        "cwd",
      },
    },
  },
}
