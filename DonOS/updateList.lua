baseUrl = "https://raw.githubusercontent.com/Crimix/DonOS/master/"
url = "DonOS/updateAll.lua"
name = "DonOS/updateAll"

file = http.get(baseUrl..url)
	if(fs.exists(name))then
		fs.delete(name)
	end
f = fs.open(name,"w")
f.write(file.readAll())
f.close()

print("Done updating "..name)