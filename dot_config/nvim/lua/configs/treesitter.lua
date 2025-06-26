local options = {
    ensure_installed = {
        "bash",
        "html",
        "lua",
        "luadoc",
        "javascript",
        "markdown",
        "php",
        "regex",
        "twig",
        "vim",
        "yaml",
    },

    highlight = {
        enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true
    },
}

return options
