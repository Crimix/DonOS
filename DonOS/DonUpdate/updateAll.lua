local list={}
local i = 0
local j = 0
baseUrl = "https://raw.githubusercontent.com/Crimix/DonOS/master/"

function set(name,url)
	list[name] = {}
	list[name]["url"]=url
end

function makeList()
	set("startup","startup.lua")
	set("DonOS/update","DonOS/update.lua")
	set("DonOS/commands","DonOS/commands.lua")
	set("DonOS/DonUpdate/updateList","DonOS/DonUpdate/updateList.lua")
    set("DonOS/api/DonKeyAPI","DonOS/API/DonKeyAPI.lua")
	set("DonOS/api/DonButtonAPI","DonOS/API/DonButtonAPI.lua")
	set("DonOS/Pocket/Menu","DonOS/Pocket/Menu.lua")
	set("DonOS/Pocket/startup","DonOS/Pocket/startup.lua")
	set("DonOS/Ref/DonRednetRef","DonOS/Ref/DonRednetRef.lua")
	set("DonOS/Ref/DonTypeRef","DonOS/Ref/DonTypeRef.lua")
	set("DonOS/Turtle/place","DonOS/Turtle/place.lua")
	set("DonOS/Turtle/break","DonOS/Turtle/break.lua")
	set("DonOS/Turtle/startup","DonOS/Turtle/startup.lua")
end

function getCount()
	for name, data in pairs(list) do
		i=i+1
	end
end

function update()
	for name, data in pairs(list) do
		file = http.get(baseUrl..data["url"])
		if(fs.exists(name))then
			fs.delete(name)
		end
		if(file ~= nil) then
			f = fs.open(name,"w")
			f.write(file.readAll())
			f.close()
			j=j+1
		end
	end
end

makeList()
getCount()
update()
--print("Updating done "..j.." Out of "..i)
		