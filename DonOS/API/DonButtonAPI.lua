local mon = term
local list ={}

function setList(value)
	list = value
	update()
end

function set(name,func,x,y,active,type)
	list[name] = {}
	list[name]["name"]=name
	list[name]["func"]=func
	list[name]["x"]=x
	list[name]["y"]=y
	list[name]["active"]=active
	list[name]["type"]=type
end

function draw(color,data)
	mon.setBackgroundColor(color)
	mon.setCursorPos(data["x"],data["y"])
	mon.write(data["name"])
	mon.setBackgroundColor(colors.black)
end

function toggle(name)
	if(list[name]["type"] == "toggle") then
		state = list[name]["active"]
		list[name]["active"] = not state
	end
	update()
end

function update()
	for name, data in pairs(list) do
		if(data["type"] == "toggle") then
			if(data["active"]) then
				draw(colors.lime,data)
			else
				draw(colors.red,data)
			end
		elseif(data["type"] == "menu") then
			draw(colors.yellow,data)
		elseif(data["type"] == "single") then
			draw(colors.blue,data)
		end
	end
end

function getButton(x,y)
	for name, data in pairs(list) do
		if(y == data["y"]) then
			if(x >= data["x"] and x <= string.len(data["name"])) then
				data["func"]()
				toggle(name)
			end
		end
	end
end