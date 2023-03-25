vim.opt.number = true

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Mouse
vim.opt.mouse = 'a'

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.equalalways = false

-- Scrolling
vim.opt.sidescroll = 1

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.backupdir = os.getenv("HOME") .. '/.config/nvim/backup//'
vim.opt.directory = os.getenv("HOME") .. '/.config/nvim/swap//'
vim.opt.undodir = os.getenv("HOME") .. '/.config/nvim/undo//'

-- Enable copying to the OS clipboard
vim.opt.clipboard = 'unnamed'

-- Misc Settings to make Coc behave well; these were taken from the coc example settings
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 100
vim.opt.shortmess = "c"
vim.opt.signcolumn = 'yes'

-- Enables autoread and triggers it whenever a buffer is entered
vim.opt.autoread = true
vim.api.nvim_create_autocmd(
    { "FocusGained", "BufEnter" },
    { 
        pattern = { "*" }, 
        command = ":silent! !"
    }
)

vim.opt.termguicolors = true

local import = require('util').import
import('editor/style')
import('editor/fonts')
import('editor/feline')
import('nvim-tree').setup({
    open_on_setup = true,
    open_on_tab = true,
    view = {
        adaptive_size = false,
        width = 50,
    },
})
