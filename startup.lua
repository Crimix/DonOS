version = 1
function start()
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.yellow)
  print("DonOS V"..version)
  term.setTextColor(colors.white)
end

function alias()
	shell.setAlias("update","DonOS/update")
	shell.setAlias("updateAll","DonOS/updateAll")
end

alias()
start()



