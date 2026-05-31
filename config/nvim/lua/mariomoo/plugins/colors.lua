return {
    {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1001,
    config = function()
        require("everforest").setup({
            transparent_background_level = 2,
            terminal_colors = true,
            styles = {
                sidebars = "dark",
                floats = "dark",
            }
        })
        vim.cmd("colorscheme everforest")
    end
  },
}

