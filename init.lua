-- Preload
require("preload")

-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

require("lazy").setup({

  {
    dir = "~/git/aexr.nvim",
    opts = {
      items = {
        n = {
          { "Custom_1", "CUSTOM1(", "_CUSTOM1)" },
        },
        v = {
          { "Custom_2", "CUSTOM2(", "_CUSTOM2)" },
        },
      }
    }
  },
  {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      require"startup".setup(require"plugins.startup_nvim")
    end
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {},
  },

  { "catppuccin/nvim",       name = "catppuccin" },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  "nvim-lualine/lualine.nvim",
  -- "rmagatti/auto-session",
  { "windwp/nvim-autopairs",         event = "InsertEnter" },
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  { 'akinsho/bufferline.nvim',       version = "*",                        dependencies = 'nvim-tree/nvim-web-devicons' },

  { 'voldikss/vim-floaterm' },

  { 'VonHeikemen/fine-cmdline.nvim', dependencies = 'MunifTanjim/nui.nvim' },

  {
    "folke/zen-mode.nvim",
    -- lazy=false,
    opts = {
      window = {
        width = 130,
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false,   -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          laststatus = 0,  -- turn off the statusline in zen mode
        },
      }
    }
  },

  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 3,
      maxkeys = 10,
      -- more opts
    }
  },

  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      return require "configs.mason"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function(_, opts)
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer", "lemminx", "jdtls", "pylsp", "ruff" },
        automatic_installation = true,
      }
    end
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
    dependencies = "rafamadriz/friendly-snippets",
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- {
      --   -- snippet plugin
      --   "L3MON4D3/LuaSnip",
      --   dependencies = "rafamadriz/friendly-snippets",
      --   opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      --   config = function(_, opts)
      --     require("luasnip").config.set_config(opts)
      --     require "configs.luasnip"
      --   end,
      -- },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  { "nvimtools/none-ls.nvim",        dependencies = { "nvim-lua/plenary.nvim" } },
  "NMAC427/guess-indent.nvim",
  { "nvim-telescope/telescope.nvim", tag = "0.1.8",                                     dependencies = { "nvim-lua/plenary.nvim" } },
  { "debugloop/telescope-undo.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
  "rcarriga/nvim-notify",
  "mrded/nvim-lsp-notify",
  "lewis6991/gitsigns.nvim",


  { 'echasnovski/mini.nvim', version = '*' },
  { "folke/which-key.nvim" },

  -- formatting!
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { lua = { "stylua" } },
    },
  },


  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    dependencies = {
      { "rcarriga/nvim-dap" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function(_, opts)
      require("dapui").setup(opts)
    end,
  },

  -- LANGUAGE SPECIFICS
  --
  -- Java
  {
    "JavaHello/spring-boot.nvim",
    lazy = true,
    dependencies = {
      "nvim-java/nvim-java", -- or nvim-java, nvim-lspconfig
    },
    config = false
  },
  {
    "nvim-java/nvim-java",
    lazy = false,
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "nvim-java/nvim-java-refactor",
      {
        "mfussenegger/nvim-dap",
        dependencies = {
          { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
        },
      },
    },

    config = function()
      require("java").setup(require("configs.java"))
    end,
  },


  -- RUST
  -- install 'rust-src' package for autocompletion to work
  {
    "rust-lang/rust.vim",
    lazy = true,
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
    end,
  },
})

-- Settings
require("general")

-- Plugins
-- require("auto-session").setup()
require("nvim-autopairs").setup()
require("line")
require("buffline")
require("cmdline")
require("tree")
require("configs.lsp")
require("completion")
require("lint")
require("guess-indent").setup {}
require("telescope").setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
vim.notify = require("notify")

require('gitsigns').setup()

-- Settings (After plugin load)
require("mappings")
require("configs.whichkey")

require("configs.dap.config")

require("configs.luasnip")
require("macros")
require('render-markdown').setup({
  completions = { lsp = { enabled = true } },
})
