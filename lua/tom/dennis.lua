M = {}

M.dennis = function()
  print("DENNIS GAYYYYYY!")
end



vim.api.nvim_create_user_command("Dennis", function()
  M.dennis()
end, {
})
