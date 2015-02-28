
function wrap(value)
	names = peripheral.getNames()
	for i = 0,5 do
		if(names[i] ~= nil) then
			name = names[i]
			Ptype = peripheral.getType(name)
			if(value == "modem" and Ptype == value) then
				rednet.open(name)
			elseif(Ptype == value) then
				return name
			else
				return nil
			end
		end
	end
end