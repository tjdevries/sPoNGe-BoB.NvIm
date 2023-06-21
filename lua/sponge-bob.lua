local M = {}

local group = vim.api.nvim_create_augroup("sponge-bob", {})

local enabled = false

M.enable = function()
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

        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local line_prefix = vim.api.nvim_buf_get_text(0, row - 1, 0, row - 1, col, {})[1]
        local last_char = string.reverse(line_prefix):gmatch "%a"()
        local last_was_lower = last_char and last_char:lower() == last_char

        if last_was_lower then
          vim.v.char = vim.v.char:upper()
        else
          vim.v.char = vim.v.char:lower()
        end
      end
    end,
  })
end

M.disable = function()
  enabled = false
  vim.api.nvim_clear_autocmds { group = group }
end

M.toggle = function(val)
  if val == nil then
    return M.toggle(not enabled)
  end

  if val then
    M.enable()
  else
    M.disable()
  end
end

return M
