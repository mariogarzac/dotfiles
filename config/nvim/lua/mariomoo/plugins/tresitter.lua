return {
    "neovim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup {
            ensure_installed = {
                "python", "c", "go", "lua", "vim",
                "javascript", "templ", "vimdoc",
            },
        }
    end
}
