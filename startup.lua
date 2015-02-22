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
	print("works")
end

function setKeys()
	DonKeyAPI.set("reactor",Keys.leftCtrl,Keys.t,text)
end

function main()
	term.setCursorPos(24,1)
	term.clearLine()
	local event, key1 = os.pullEvent("key")
	if(key1 == Keys.leftCtrl)then
		local event key2 = os.pullEven("key")
		print(key1.." + ?")
		term.clearLine()
		DonKeyAPI.run(key1,key2)
	end
end

if(pocket) then
	alias()
	start()
	if(fs.exists("userstartup"))then
		shell.run("userstartup")
	end
	setKeys()
	main()
else
	shell.run("startup")
end





