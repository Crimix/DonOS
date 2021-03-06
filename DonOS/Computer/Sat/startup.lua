rednet.open(DonWrap.wrap(DonWrapList.modem))
local dataList = {}



function readIDS()
	if(fs.exists("temp/ids")) then
		file = fs.open("temp/ids","r")
		dataList = textutils.unserialize(file.readAll())
		file.close()
	end
end

function saveIDS()
	if(fs.exists("temp/ids")) then
		fs.delete("temp/ids")
	end
	file = fs.open("temp/ids","w")
	file.writeLine(textutils.serialize(dataList))
	file.close()
end	


function saveID(name,id)
	dataList[name] = {}
	dataList[name]["name"] = name
	dataList[name]["id"] = id
	saveIDS()
end

function recive()
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	print("Recived command "..data["msg"])
	if(data["msg"] == "type")then
		if(data["rId"] == "pocket")then
			rednet.send(id,"msg")
		else
			saveID(data["rId"],data["sId"])
		end
	elseif(data["msg"] == "refreshMain")then
		rednet.send(data["rId"],msg)
	else
		rednet.send(dataList[data["rId"]]["id"],msg)
	end
end

readIDS()
while true do
	recive()
end



