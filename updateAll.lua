local list={}
baseUrl = "https://raw.githubusercontent.com/Crimix/DonOS/master/"

function set(name,url)
	list[name] = {}
	list[name]["url"]=url
end

function makeList()
	set("startup","startup.lua")
end

function update()
	for name, data in pairs(list) do
		file = http.get(baseUrl..data["url"])
		if(file ~= nil) then
			f = fs.open(name,"w")
			f.write(file.readAll())
			f.close()
		end
	end
end

makeList()
update()
		