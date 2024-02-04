vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "typescript",
        command = "setlocal ts=2 sw=2"
    }
)

vim.g.OmniSharp_server_use_mono = 1
    
