local set = vim.opt

-- set.t_Co = 256
set.wrap = false
set.termguicolors = true

-- Palettes are the base color defines of a colorscheme.
-- You can override these palettes for each colorscheme defined by nightfox.
local palettes = {
  nightfox = {},
}

local groups = {
  nightfox = {
    NormalFloat = { fg = "palette.red", bg = "palette.blue" },
    FloatBorder = { fg = "palette.green" },
    CocInlayHint = {
      fg = "palette.yellow.dim",
      bg = "palette.bg1",
      style = "italic",
    }
  }
}

require("nightfox").setup({ palettes = palettes, groups = groups })

vim.api.nvim_command('colorscheme nightfox')
