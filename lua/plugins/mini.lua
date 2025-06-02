return {
  {
    'echasnovski/mini.nvim',
    cond = not vim.g.vscode,
    config = function()
      require('mini.icons').setup()
      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = true,
        content = {
          inactive = function()
            return "%#MiniStatuslineInactive#%t%="
          end,

          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git           = MiniStatusline.section_git({ trunc_width = 40 })
            local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })

            --filename here is not used because i subsituted it for '%t' which return the relative path
            --i keep it here just in case i want to revert quickly or make other changes

            local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location      = MiniStatusline.section_location({ trunc_width = 75 })
            local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
              { hl = mode_hl,                 strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { '%f' } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl,                  strings = { search, location } },
            })
          end
        }
      }
    end
  }
}
