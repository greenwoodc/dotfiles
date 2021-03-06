local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'monsonjeremy/onedark.nvim'
  use 'marko-cerovac/material.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = false}
  }
  require('nvim-web-devicons').setup {
      default = true;
  }
  require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'material',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
                {'branch'},
                {'diff',
                    colored = true,
                    diff_color = {
                        added = nil,
                        modified = nil,
                        removed = nil,
                    },
                    symbols = {
                        added = '+',
                        modified = '~',
                        removed = '-'
                    }
                },
                {'diagnostics', sources={'nvim_lsp', 'coc'}}
            },
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1,
                shorting_target = 40
            }
        },
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
    
  }
end)
