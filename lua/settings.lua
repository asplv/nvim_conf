local options = {
  tabstop        = 4,                                                   --- how tab looks like
  shiftwidth     = 4,                                                   --- should be equal tabstop
  smartindent    = true,                                                ---
  number         = true,                                                --- shows current line number
  wrap           = true,                                                --- display long lines as just one line
  cursorline     = true,                                                --- highlight of current line
  colorcolumn    = '121',                                               --- wrap visual guide
  hidden         = false,                                               ---
  laststatus     = 2,                                                   --- always show statusline
  ruler          = true,                                                --- good info in status lline
  listchars      = 'eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣', --- whitespace signs
  ignorecase     = true,                                                ---
  smartcase      = true,                                                --- if all lower then ignorecase
  hlsearch       = true,                                                ---
  incsearch      = true,                                                ---
  mouse          = '',                                                  --- mouse off
  backup         = false,                                               ---
  undofile       = true,                                                ---
  swapfile       = true,                                                ---
  termguicolors  = false,                                               --- Correct terminal colors
}

local globals = {
  netrw_banner      = 0,                       --- banner off --- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
  netrw_liststyle   = 3,                       --- tree view
  netrw_winsize     = 20,                      --- percent of window
  mapleader         = ' ',                     --- map leader key
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end

vim.opt.path = vim.opt.path + '**'

local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
vim.opt.undodir = { prefix .. "/nvim/.undo//"}
vim.opt.directory = { prefix .. "/nvim/.swp//"}

vim.cmd('colorscheme darcula')

