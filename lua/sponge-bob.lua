local M = {}

local group = vim.api.nvim_create_augroup("sponge-bob", {})

local enabled = false
local upper = false

M.enable = function(alternate)
  enabled = true
  vim.api.nvim_clear_autocmds { group = group }
  vim.api.nvim_create_autocmd("InsertCharPre", {
    group = group,
    callback = function()
      if enabled then
        -- ToDo: I DoNt tHiNk thIs wOrKs rIgHt nOw
        -- BuT We GoTtA GeT ThIs tO PrOdUcTiOn aSaP
        if vim.v.char == "<BS>" then
          return
        end

        if upper and not alternate then
          vim.v.char = vim.v.char:upper()
        else
          vim.v.char = vim.v.char:lower()
        end

        upper = not upper
      end
    end,
  })
end

M.disable = function()
  enabled = false
  vim.api.nvim_clear_autocmds { group = group }
end

M.toggle = function(val, alternate)
  if val == nil then
    return M.toggle(not enabled)
  end

  if val then
    M.enable(alternate)
  else
    M.disable()
  end
end

return M
