local list ={}
function set(name,key1,key2,func)
	list[name] = {}
	list[name]["key1"]=key1
	list[name]["key2"]=key2
	list[name]["func"]=func
end

function run(key1,key2)
	for name, data in pairs(list) do
		if(data["key1"] == key1) then
			if(data["key2"] == key2) then
				data["func"]()
			end
		end
	end
end