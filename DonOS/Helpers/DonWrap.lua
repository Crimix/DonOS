
function wrap(value)
	names = peripheral.getNames()
	for i = 0,5 do
		if(names[i] ~= nil) then
			name = names[i]
			Ptype = peripheral.getType(name)
			if(Ptype == value) then
				return peripheral.wrap(name)
			else
				return nil
			end
		end
	end
end