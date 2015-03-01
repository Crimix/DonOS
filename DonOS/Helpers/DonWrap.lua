function wrap(value)
	names = peripheral.getNames()
	for i = 0,6 do
		if(names[i] ~= nil) then
			name = names[i]
			Ptype = peripheral.getType(name)
			if(Ptype == value) then
				return name
			end
		end
	end
end