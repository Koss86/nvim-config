return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "moon",
        styles = {
            comments = { italic = false, bold = true },
            keywords = { italic = false, bold = true },
            functions = { italic = true },
            variables = {},
            dim_inactive = true,
        },
    },
    init = function()
        vim.cmd[[colorscheme tokyonight]]
        on_colors = function(colors)
            colors.hint = colors.orange
            colors.error = "#ff0000"
        end
    end
}
