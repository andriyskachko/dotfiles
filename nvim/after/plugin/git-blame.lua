require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = false,
}

vim.api.nvim_set_keymap("n", "<leader>vtb", ":GitBlameToggle <CR>", { noremap = true })
