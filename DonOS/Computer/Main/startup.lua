os.loadAPI("DonOS/Ref/DonRednetRef")
os.loadAPI("DonOS/Ref/DonWrapList")
os.loadAPI("DonOS/Helpers/DonWrap")
rednet.open(DonWrap.wrap(DonWrapList.modem))
print("Main V1 By DonF")
local list ={}
local dataList ={}

function refresh(value)
	id = value["sId"]
	datalist["sId"] = DonRednetRef.main
	datalist["rId"] = id
	dataList["msg"] = "refresh"
	dataList["data"] = list
	rData = textutils.serialize(dataList)
	redet.send(id,rData)
end

function setList(value)
	list = value["data"]
end

function recive()
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	data["msg"](data)
end