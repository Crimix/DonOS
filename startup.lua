version = 1
os.loadAPI("DonOS/api/DonKeyAPI")
function start()
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.yellow)
  print("DonOS V"..version)
  term.setTextColor(colors.white)
end

function alias()
	shell.setAlias("update","DonOS/update")
	shell.setAlias("DonHelp","DonOS/commands")
end

function text()
	print("Reactor control")
	local evnet, keyR = os.pullEvent("key")
	if(keyR == keys.i) then
		print("Reactor on")
	elseif(keyR == keys.o) then
		print("Reactor off")
	end
end

function setKeys()
	DonKeyAPI.set("reactor",Keys.leftCtrl,Keys.r,text)
end

function main()
	local event, key1 = os.pullEvent("key")
	local event key2 = os.pullEven("key")
	DonKeyAPI.run(key1,key2)
end

if(pocket) then
	alias()
	start()
	if(fs.exists("userstartup"))then
		shell.run("userstartup")
	end
	setKeys()
	while true do
		start()
		main()
	end
else
	shell.run("startup")
end





