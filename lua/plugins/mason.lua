-- Mason packet manager
return {
  "mason-org/mason.nvim",
  cond = not vim.g.vscode,
  build = ":MasonUpdate",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
}
