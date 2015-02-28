rednet.open(DonWrap.wrap(DonWrapList.modem))

function recive()
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	print("Recived command "..data["msg"])
	rednet.send(data["rId"],msg)
end

while true do
	recive()
end



