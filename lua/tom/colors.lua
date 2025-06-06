function BgOn(color)
  color = color or "rose-pine"
  if color == "" then
    color = "rose-pine"
  end
  vim.cmd.colorscheme(color)
end

function BgOff(color)
  color = color or "rose-pine"
  if color == "" then
    color = "rose-pine"
  end
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.api.nvim_create_user_command("BgOn", function(opts)
  BgOn(opts.args)
end, {
  nargs = "?",
  desc = "Turn off transparent background"
})


vim.api.nvim_create_user_command("BgOff", function(opts)
  BgOff(opts.args)
end, {
  nargs = "?",
  desc = "Turn on transparent background"
})
