baseUrl = "https://raw.githubusercontent.com/Crimix/DonOS/master/"
url = "updateAll.lua"
name = "updateAll"

file = http.get(baseUrl..data["url"])
	if(fs.exists(name))then
		fs.delete(name)
	end
f = fs.open(name,"w")
f.write(file.readAll())
f.close()

print("Done updating "..name)