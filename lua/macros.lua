local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

-- vim.fn.setreg("t", "ihello" .. esc .. "o" .. esc)

vim.api.nvim_create_augroup("PYLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "PYLogMacro",
  pattern = { "python" },
  callback = function()
    vim.fn.setreg("p", "yoprint(f'" .. esc .. "pa: {" .. esc .. "pa}')" .. esc)
    vim.fn.setreg("l", "viwyoprint(f'" .. esc .. "pa: {" .. esc .. "pa}')" .. esc)
  end,
})
