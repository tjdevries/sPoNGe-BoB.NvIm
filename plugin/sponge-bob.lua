vim.api.nvim_create_user_command("SpOnGeBoBsWaP", function()
  require("sponge-bob").toggle(true, false)
end, {})

vim.api.nvim_create_user_command("SpOnGeBoBtOgGlE", function()
  require("sponge-bob").toggle()
end, {})

vim.api.nvim_create_user_command("SpOnGeBoBeNaBlE", function()
  require("sponge-bob").toggle(true)
end, {})

vim.api.nvim_create_user_command("SpOnGeBoBdIsAbLe", function()
  require("sponge-bob").toggle(false)
end, {})
