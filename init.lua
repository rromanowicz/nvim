vim.g.mapleader = " "

vim.diagnostic.config({ virtual_lines = true })

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.list = true
vim.o.showtabline = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.encoding = "utf-8"
vim.o.spell = true
vim.o.pumheight = 15
vim.o.pumblend = 15
vim.o.syntax = "on"
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.autoread = true
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.termguicolors = true
require("vim._core.ui2").enable({})

vim.keymap.set("n", "<c-n>", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<Tab>", ":bnext<cr>")
vim.keymap.set("n", "<s-Tab>", ":bprev<cr>")
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("n", "<C-S-p>", "<cmd> vertical resize -5 <CR>", { desc = "Vertical resize -5" })
vim.keymap.set("n", "<C-S-\\>", "<cmd> vertical resize +5 <CR>", { desc = "Vertical resize +5" })
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("v", "y", "\"+y")
vim.keymap.set("v", "x", "\"+x")
vim.keymap.set("n", "p", "\"+p")
vim.api.nvim_set_keymap('t', '<C-Esc>', '<C-\\><C-n>', { noremap = true })

-- Plugins
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim",           name = "catppuccin" },
  { src = "https://github.com/olimorris/onedarkpro.nvim", name = "onedarkpro" },
  { src = "https://github.com/tpope/vim-sleuth" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  {
    src = "https://github.com/nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        view = {
          adaptive_size = true,
        },
        update_focused_file = {
          enable = true,
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
      })
    end
  },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/voldikss/vim-floaterm" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/folke/zen-mode.nvim", },
  { src = "https://github.com/nvzone/showkeys", },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim" },
  {
    src = "https://github.com/rachartier/tiny-cmdline.nvim",
    config = function()
      vim.o.cmdheight = 0
      require("tiny-cmdline").setup({
        border = nil,
      })
      vim.api.nvim_set_hl(0, "TinyCmdlineBorder", { fg = "#282c34" })
      vim.api.nvim_set_hl(0, "TinyCmdlineNormal", { bg = "#282c34" })
    end,
  },
  { src = "https://github.com/startup-nvim/startup.nvim" },
})

require("nvim-tree").setup()
require("plugins.theme")
require("configs.whichkey")
require("line")
require("buffline")

vim.pack.add({
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = "v1.6.0",
    config = function()
      require("blink.cmp").setup({
        keymap = {
          preset = 'default',
          ['<CR>'] = { 'select_and_accept', 'fallback' },
        },
        appearance = {
          nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = true } },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust" }
      })
    end
  },
  { src = "https://github.com/mason-org/mason.nvim.git" },
  {
    src = "https://github.com/mason-org/mason-lspconfig.nvim.git",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer", "lemminx", "jdtls", "pylsp", "ruff", "gopls", "bashls" },
        automatic_installation = true,
      }
    end
  },
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  {
    src = "https://github.com/romus204/tree-sitter-manager.nvim",
    config = function()
      require("tree-sitter-manager").setup({
        ensure_installed = { "python", "rust", "lua", "go", "luadoc", "printf", "vim", "vimdoc", "markdown", "markdown_inline" },
      })
    end
  }
})

require("blink.cmp").setup()
require("tree-sitter-manager").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("nvim-treesitter").setup()

vim.pack.add({
  { src = "https://github.com/ray-x/go.nvim" },
  { src = "https://github.com/ray-x/guihua.lua" },
})
require("go").setup()

-- LSP
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
vim.lsp.config("pylsp", {})
vim.lsp.config("gopls", {})
vim.lsp.config("rust_analyzer", {})
