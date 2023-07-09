vim.api.nvim_create_user_command("SpOnGeBoBtOgGlE", function()
  require("sponge-bob").toggle()
end, {})

vim.api.nvim_create_user_command("SpOnGeBoBeNaBlE", function()
  require("sponge-bob").toggle(true)
end, {})

vim.api.nvim_create_user_command("SpOnGeBoBdIsAbLe", function()
  require("sponge-bob").toggle(false)
end, {})

vim.api.nvim_create_user_command("SpOnGeBoBiFy", function(args)
  local start = args["line1"]
  local fin = args["line2"]
  require("sponge-bob").spongebobify(start, fin)
end, {range = true})
