local settings = {
  logo = {
    type = "text",
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = require("startup.headers").hydra_header,
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
  },  weather = {
    type = "text",
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = require("aexr").weather.box(),
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
  },
  date_section = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Quote",
    margin = 5,
    content = function()
      local clock = " " .. os.date "%H:%M"
      local date = " " .. os.date "%a %d %b %Y "
      return { clock .. "  |  " .. date }
    end,
    highlight = "Constant",
    default_color = "",
    oldfiles_amount = 0,
  },
  commands_section = {
    type = "mapping",
    align = "center",
    fold_section = false,
    title = "Basic Commands",
    margin = 5,
    content = {
      { " Find File", "Telescope find_files", "<leader>ff" },
      { "󰍉 Find Word", "Telescope live_grep", "<leader>lg" },
      { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
    },
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
  },
  recent_files_dir = {
    type = "oldfiles",
    oldfiles_directory = true,
    align = "center",
    fold_section = false,
    title = "Oldfiles of Directory",
    margin = 5,
    content = {},
    highlight = "String",
    default_color = "#FFFFFF",
    oldfiles_amount = 5,
  },
  recent_files = {
    type = "oldfiles",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Oldfiles",
    margin = 5,
    content = { "startup.nvim" },
    highlight = "TSString",
    default_color = "#FFFFFF",
    oldfiles_amount = 5,
  },
  options = {
    after = function()
      require("startup.utils").oldfiles_mappings()
    end,
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = false,
    disable_statuslines = true,
    paddings = { 2, 2, 2, 2, 2, 2, 2 },
  },
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2",
  },
  parts = {
    "logo",
    "date_section",
    "weather",
    "commands_section",
    "recent_files_dir",
    "recent_files",
  },
}
return settings
