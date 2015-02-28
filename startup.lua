version = 1
function start()
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.yellow)
  print("DonOS V"..version)
  term.setTextColor(colors.white)
end


if(pocket) then
	shell.run("DonOS/Pocket/startup")
elseif(computer)
	shell.run("startup")
end





