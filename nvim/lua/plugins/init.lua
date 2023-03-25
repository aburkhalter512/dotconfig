local Plug = require 'plugins/plugins'

Plug.begin()

-- Styles
Plug 'tomasiser/vim-code-dark'
Plug 'EdenEast/nightfox.nvim'
Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'vim-airline/vim-airline'

-- Editor
Plug 'feline-nvim/feline.nvim'
Plug 'nanozuki/tabby.nvim'
Plug 'airblade/vim-gitgutter'
-- Plug 'preservim/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'


-- Code Search
Plug 'kien/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'

-- Utils
Plug 'eparreno/vim-l9'

-- Langs
Plug('neoclide/coc.nvim', {branch =  'release'})
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'

-- Clojure
Plug 'Olical/conjure'
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'

Plug.ends()

vim.g.plug_window = 'tab new'

