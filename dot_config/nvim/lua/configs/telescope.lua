local options = {
    defaults = {
        layout_config = {
            height = 0.95,
            prompt_position = "top",
        },
    },
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ["<C-d>"] = require("telescope.actions").delete_buffer,
                },
            },
        },
    },
}

return options
