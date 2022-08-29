local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<F11>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
map('n', '<F12>', ':set list!<CR>', default_opts)

map('n', '<Leader>h', ':Lexplore<CR>', default_opts)
map('n', '<Leader>H', ':Lexplore %:p:h<CR>', default_opts)

map('n', '<ESC>', ':noh<CR><ESC>', default_opts)

map('n', '<Leader>y', '"*y', default_opts)
map('n', '<Leader>p', '"*p', default_opts)
map('n', '<Leader>Y', '"+y', default_opts)
map('n', '<Leader>P', '"+p', default_opts)

map('n', '/', '/\\v', default_opts)
map('v', '/', '/\\v', default_opts)
map('n', '?', '?\\v', default_opts)
map('v', '?', '?\\v', default_opts)

vim.api.nvim_exec([[
function! CloseAllBuffersButCurrentSoft()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

function! CloseAllBuffersButCurrentHard()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd!"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd!" | endif
endfunction
]], false)

map('n', '<Leader>w', ':exec "call CloseAllBuffersButCurrentSoft()"<CR>', default_opts)
map('n', '<Leader>W', ':exec "call CloseAllBuffersButCurrentHard()"<CR>', default_opts)
map('n', '<Leader>l', ':ls<CR>', default_opts)
map('n', '<Leader>t', ':enew<CR>', default_opts)
map('n', '<Leader>q', ':bd<CR>', default_opts)
map('n', '<Leader>Q', ':bd!<CR>', default_opts)
map('n', '<Leader>j', ':bp!<CR>', default_opts)
map('n', '<Leader>k', ':bn!<CR>', default_opts)

map('n', '<F8>', ':mksession .mysession.vim<CR>', default_opts)
map('n', '<F9>', ':source .mysession.vim<CR>', default_opts)

