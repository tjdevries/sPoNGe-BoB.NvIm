local M = {}

local group = vim.api.nvim_create_augroup("sponge-bob", {})

local enabled = false
local upper = false

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

        if upper then
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

-- a fUnCtIoN FoR TaKiNg iNPuT TeXt aNd oUtPuTiNg iT iN SpOnGe-bOb cAsE.
-- ThIs iS NoN-ReVeRsAbLe, AnD OpErAtEs oN WhOlE LiNeS
-- StArT Is tHe _ReAl_ LiNe-nUmBeR PaSsEd iN By tHe cOmMaNd
M.spongebobify = function(start, fin)
	local lines = vim.api.nvim_buf_get_lines(0, start-1, fin, false)
	local modified = {}
	for i, _ in pairs(lines) do
		local line = lines[i]
		upper = false
		local l = {}
		for char in line:gmatch('.') do
			if upper then
				char = string.upper(char)
			else
				char = string.lower(char)
			end
			table.insert(l, char)
			upper = not upper
		end
		table.insert(modified, table.concat(l, ""))
	end

	vim.api.nvim_buf_set_lines(0, start-1, fin, false, modified)
end

return M
