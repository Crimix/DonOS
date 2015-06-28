print("Reactor Off")

br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
br.setActive(false)
if(not(DonWrap.wrap(DonWrapList.capBank) == nil))then
	rs.setOutput(DonWrap.wrap(DonWrapList.capBank),false)
end