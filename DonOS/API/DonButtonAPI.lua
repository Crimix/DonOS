local mon
local list ={}

function isMon(value)
	if(value)
		mon = mon
	else
		mom = term
	end
end

function set(name,func,x,y,active,menu)
	list[name] = {}
	list[name]["name"]=name
	list[name]["func"]=func
	list[name]["x"]=x
	list[name]["y"]=y
	list[name]["active"]=active
	list[name]["menu"]=menu
end

function draw(color,data)
	mon.setBackgroundColor(color)
	mon.setCursorPos(data["x"],data["y"])
	mon.write(data["name"])
	mon.setBackgroundColor(colors.black)
end

function toggle(name)
	if(~list[name]["menu"]) then
		state = list[name]["active"]
		list[name]["active"] = ~state
		update()
	else
		x = 1
	end
end

function update()
	for name, data in pairs(list) do
		if(~data["menu"]) then
			if(data["active"]) then
				draw(colors.lime,data)
			else
				draw(colors.red,data)
			end
		else
			draw(colors.yellow,data)
		end
	end
end

function getButton(x,y)
	for name, data in pairs(list) do
		if(y == data["y"]) then
			if(x <= data["x"] and x >= string.len(data["name"]) then
				data["func"]()
			end
		end
	end
end