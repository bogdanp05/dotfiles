-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "html",
        "go",
        "gitignore",
        "graphql",
        "hcl",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "terraform",
        "typescript",
        "vim",
    },
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
})
