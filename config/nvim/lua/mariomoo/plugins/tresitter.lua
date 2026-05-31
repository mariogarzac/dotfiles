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
        vim.api.nvim_create_autocmd('FileType', {
        pattern = {"python", "c", "go", "lua", "vim", "javascript", "templ", "vimdoc" },
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
        })
    end
}
