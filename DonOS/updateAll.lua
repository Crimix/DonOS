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
	set("DonOS/updateList","DonOS/updateList.lua")
    set("DonOS/api/DonKeyAPI","DonOS/API/DonKeyAPI.lua")
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
print("Updating done "..j.." Out of "..i)
		