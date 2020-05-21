local api      = vim.api
local libmodal = require('libmodal')

local _inputHistory = {}

function _inputHistory:clear(indexToCheck)
	if #self >= indexToCheck then
		for i, _ in ipairs(self) do
			self[i] = nil
		end
	end
end

function fooMode()
	inputHistory[#inputHistory + 1] = string.char(
		api.nvim_get_var('fooModeInput')
	)

	local index = 1
	if inputHistory[1] == 'z' then
		if inputHistory[2] == 'f' then
			if inputHistory[3] == 'o' then
				api.nvim_command("echom 'It works!'")
			else index = 3
			end
		else index = 2
		end
	end

	_inputHistory:clear(index)
end

libmodal.mode.enter('FOO', fooMode)
