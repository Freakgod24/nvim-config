local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugguer",
    },
  }
}
M.git = {
    plugin = true,
    n = {
        ["<leader>gg"] = {
            "<cmd> LazyGit <CR>",
            "Open LazyGit",
        },
        ["<leader>fg"] = {
            "<cmd> Telescope git_files <CR>",
            "Find git files",
        },
    },
}
M.cmake = {
    plugin = true,
    n = {
        ['<leader>cg'] = {
            "<cmd> CMakeGenerate <CR>",
            "Generate CMake configuration"
        },
        ['<leader>cb'] = {
            "<cmd> CMakeBuild <CR>",
            "Execute CMake build"
        },
        ['<leader>cr'] = {
            "<cmd> CMakeRun <CR>",
            "Run CMake target"
        },
    }
}
M.crates = {
    n = {
        ['<leader>rcu'] = {
            function ()
                require('crates').upgrade_all_crates()
            end,
            'update crates'
        }
    }
}
return M
