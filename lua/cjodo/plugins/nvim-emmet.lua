return {
    "olrtg/nvim-emmet",
    config = function()
        local em = require("nvim-emmet")
        vim.keymap.set({"n", "v"}, '<leader>mw', function ()
            em.wrap_with_abbreviation();
        end)
    end
}
