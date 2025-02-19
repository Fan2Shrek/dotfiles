local keys = {
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },

    { "<leader>s:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },

    { "gr", function() Snacks.picker.lsp_references() end, desc = "Projects" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
}

return keys
