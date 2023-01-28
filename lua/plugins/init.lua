local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  { 'prichrd/netrw.nvim',
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      -- require('nvim-web-devicons').setup()
      require('netrw').setup()
    end
  },
  {
    'tpope/vim-vinegar',
  },
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
