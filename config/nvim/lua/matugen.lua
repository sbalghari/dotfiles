 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#121319',
    base01 = '#1f1f25',
    base02 = '#292930',
    base03 = '#908f9e',
    base04 = '#c6c5d4',
    base05 = '#e4e1ea',
    base06 = '#e4e1ea',
    base07 = '#e4e1ea',
    base08 = '#ffb4ab',
    base09 = '#ffa9fa',
    base0A = '#c0c3f0',
    base0B = '#bcc2ff',
    base0C = '#ffa9fa',
    base0D = '#bcc2ff',
    base0E = '#c0c3f0',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e4e1ea',          bg = '#121319' })
  hi('TelescopeBorder',         { fg = '#908f9e',             bg = '#121319' })
  hi('TelescopePromptNormal',   { fg = '#e4e1ea',          bg = '#121319' })
  hi('TelescopePromptBorder',   { fg = '#908f9e',             bg = '#121319' })
  hi('TelescopePromptPrefix',   { fg = '#bcc2ff',             bg = '#121319' })
  hi('TelescopePromptCounter',  { fg = '#c6c5d4',  bg = '#121319' })
  hi('TelescopePromptTitle',    { fg = '#121319',             bg = '#bcc2ff' })
  hi('TelescopePreviewTitle',   { fg = '#121319',             bg = '#c0c3f0' })
  hi('TelescopeResultsTitle',   { fg = '#121319',             bg = '#ffa9fa' })
  hi('TelescopeSelection',      { fg = '#e4e1ea',          bg = '#292930' })
  hi('TelescopeSelectionCaret', { fg = '#bcc2ff',             bg = '#292930' })
  hi('TelescopeMatching',       { fg = '#bcc2ff',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
