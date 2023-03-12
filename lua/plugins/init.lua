local plugins = {

  { 'nvim-lua/plenary.nvim' },

  { "nvim-tree/nvim-web-devicons" },

  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
      end, {})
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      -- require("core.utils").lazy_load "nvim-treesitter"
    end,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    init = function()
      -- require("core.utils").lazy_load "indent-blankline.nvim"
      -- require("core.utils").load_mappings "blankline"
    end,
    config = function()
      require("plugins.configs.others").blankline()
    end,
  },

  { 'prichrd/netrw.nvim',
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require('netrw').setup()
    end
  },
  
  { 'tpope/vim-vinegar' },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd[[colorscheme zenwritten]]
    end
  },
}

-- load lazy.nvim options
-- local lazy_config = require "plugins.configs.lazy_nvim"
--require("lazy").setup(plugins, lazy_config)
require("lazy").setup(plugins)
