local plugins = {
  -- Git
  {
        "NeogitOrg/neogit",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
            "ibhagwan/fzf-lua",
        },
        config = function()
            require("neogit").setup({})
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("core.utils").load_mappings("git")
        end,
    },
  -- Treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "html",
        "css",
        "javascript",
        "typescript",
      }
    }
  },
  --Mason plugins dependencies
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- C/C++ lsp
        "clangd",
        "clang-format",
        "codelldb",
        -- Python lsp
        "debugpy",
        "black",
        "mypy",
        "ruff",
        "pyright",
        -- WebDev lsp
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
      },
    },
  },
  --LSP configurations
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  --Utilities
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    config = function()
      require('transparent').setup({
        extra_groups = {
          "NvimTreeNormal"
        }
      })
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },
  {
    "tpope/vim-surround",
    event = "BufEnter"
  },
  -- Compilers
  {
    "Civitasv/cmake-tools.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function ()
      require('cmake-tools').setup({
        cmake_command = "cmake",
        cmake_console_size = 10,
        cmake_show_console = "always",
        cmake_executor = {
                    name = "quickfix"
                }
      })
      require("core.utils").load_mappings("cmake")
    end
  },
  -- Debuggers
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function ()
      local path = "~/.local/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      --require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function ()
      dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
    end
  },
}
return plugins
