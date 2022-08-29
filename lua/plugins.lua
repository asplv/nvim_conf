local execute = vim.api.nvim_command
local packer = nil
-- check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

local function init()
  if not is_installed then
      if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
          execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
          execute("packadd packer.nvim")
          print("Installed packer.nvim.")
          is_installed = 1
      end
  end

  if not is_installed then return end
  if packer == nil then
      packer = require('packer')
      packer.init({
          -- we don't want the compilation file in '~/.config/nvim'
          disable_commands = true,
          compile_path = compile_path
      })
  end

  local use = packer.use
  packer.reset()
  --- packer kostyl
  use {'wbthomason/packer.nvim'}

  use {'lewis6991/impatient.nvim'} -- fast load
  use {'nathom/filetype.nvim'}     -- fast load 2

  --- telescope
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'}
    }
  }

  --- color schemas
  use {'ErichDonGubler/vim-sublime-monokai'}
  use {'blueshirts/darcula'}
  use {'arcticicestudio/nord-vim'}
  use {'sjl/badwolf'}
  use {'morhetz/gruvbox'}
  use {'sonph/onehalf'}
  use {'kyoz/purify'}
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
