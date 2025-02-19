local options = {
    ensure_installed = {
        "bash",
        "html",
        "lua",
        "luadoc",
        "javascript",
        "markdown",
        "printf",
        "php",
        "regex",
        "twig",
        "vim",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = {
        enable = true
    },
}

require("nvim-treesitter.configs").setup(options)
