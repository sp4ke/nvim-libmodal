--- @class libmodal.utils.classes
return
{
	--- define a metatable.
	--- @param template nil|table the default value
	new = function(template)
		-- set self to `template`, or `{}` if nil.
		local self = template or {}

		-- set `__index`.
		if not self.__index then
			self.__index = self
		end

		return self
	end,
}
