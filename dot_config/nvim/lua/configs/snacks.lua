local keys = {
    { "<C-n>", function() Snacks.explorer() end, desc = "File Explorer" },

    { "<leader>ff", function() Snacks.picker.smart() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },

    { "<leader>fl", function() Snacks.picker.lines() end, desc = "Buffer Lines" },

    { "<leader>s:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },

    { "grr", function() Snacks.picker.lsp_references() end, desc = "Projects" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
}

return keys
