require("onedarkpro").setup({
  colors = {
    cursorline = "#29394f",
    line_number = "#56b6c2",
    float_bg = "#282c34",
    inlay_hint = "#282c34",
    -- bg = "#282c34",
    -- bg1 = "#abb2bf",
    -- fg = "#abb2bf",
    -- red = "#e06c75",
    -- orange = "#d19a66",
    -- yellow = "#e5c07b",
    -- green = "#98c379",
    -- cyan = "#56b6c2",
    -- blue = "#61afef",
    -- purple = "#c678dd",
    -- white = "#abb2bf",
    -- black = "#282c34",
    -- gray = "#5c6370",
    -- highlight = "#e2be7d",
    -- comment = "#7f848e",
    -- none = "NONE",
  },
  options = {
    cursorline = true
  }
})

-- vim.cmd("colorscheme onedark")


require("catppuccin").setup {
  flavour = "mocha",
  color_overrides = {
    all = {
      text = "#cdd6f4",
    },
    latte = {},
    frappe = {},
    macchiato = {},
    mocha = {
      base = "#282c34",
      mantle = "#242424",
      crust = "#474747",
      rosewater = "#f5e0dc",
      flamingo = "#f2cdcd",
      pink = "#f5c2e7",
      mauve = "#e09f77",
      red = "#f38ba8",
      maroon = "#cdd6f4",
      peach = "#e09f77",
      yellow = "#f9e2af",
      green = "#a6e3a1",
      teal = "#94e2d5",
      sky = "#89dceb",
      sapphire = "#74c7ec",
      blue = "#61afef", -- methods & variables
      lavender = "#cdd6f4",
      text = "#cdd6f4",
      subtext1 = "#bac2de",
      subtext0 = "#a6adc8",
      overlay2 = "#9399b2",
      overlay1 = "#7f849c",
      overlay0 = "#6c7086",
      surface2 = "#585b70",
      surface1 = "#45475a",
      surface0 = "#313244",
    },
  }
}


vim.cmd("colorscheme catppuccin")

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "grey" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "orange" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "grey" })
