return {
    {
        "terrortylor/nvim-comment",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        config = function()
            require('ts_context_commentstring').setup({ enable_autocmd = false })
            require('nvim_comment').setup({
                comment_empty = false,
                hook = function()
                    require('ts_context_commentstring.internal').update_commentstring()
                end,
            })
        end,
    },
}
