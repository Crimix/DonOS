rednet.open(DonWrap.wrap(DonWrapList.modem))
print("Main V1 By DonF")
local list ={}
local dataList ={}

function refresh(value)
	dataList ={}
	id = value["sId"]
	dataList["sId"] = DonRednetRef.main
	dataList["rId"] = id
	dataList["msg"] = "refresh"
	dataList["data"] = list
	rData = textutils.serialize(dataList)
	rednet.send(DonRednetRef.sat,rData)
end

function setList(value)
	list ={}
	list = value["data"]
end

function recive()
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	if(data["msg"] == "refresh")then
		refresh(data)
	elseif(data["msg"] == "setList")then
		setList(data)
	end
end

while true do
	recive()
end