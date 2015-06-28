print("Reactor On")

br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
br.setActive(true)
if(not(DonWrap.wrap(DonWrapList.capBank) == nil))then
	rs.setOutput(DonWrap.wrap(DonWrapList.capBank),true)
end