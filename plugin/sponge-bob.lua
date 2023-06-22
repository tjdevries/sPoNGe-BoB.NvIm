vim.api.nvim_create_user_command("sPoNgEbObToGgLe", function(alternate)
  require("sponge-bob").toggle(true, true)
end, {})

vim.api.nvim_create_user_command("sPoNgEbObEnAbLe", function(alternate)
  require("sponge-bob").toggle(true, true)
end, {})

vim.api.nvim_create_user_command("sPoNgEbObDiSaBlE", function()
  require("sponge-bob").toggle(false)
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
