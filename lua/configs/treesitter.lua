pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = { "python", "rust", "lua", "go", "luadoc", "printf", "vim", "vimdoc", "markdown", "markdown_inline" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}
