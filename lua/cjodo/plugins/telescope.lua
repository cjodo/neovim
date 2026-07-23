local HEIGHT_RATIO = 0.6
local WIDTH_RATIO = 0.8

  return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },

    config = function ()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    vim.keymap.set('n', '<leader>G', function() builtin.live_grep() end, {desc = "Telescope - live_grep"})

      telescope.setup({
        defaults = {
          layout_strategy = 'vertical',
          layout_config = {
            vertical = { width = WIDTH_RATIO, height = HEIGHT_RATIO }
          }
        }
      })
    end
  }
