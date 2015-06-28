print("Reactor On")

br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
br.setActive(true)
if(DonWrap.wrap(DonWrapList.capBank)) not nil)then
	rs.setOutput(DonWrap.wrap(DonWrapList.capBank),true)
end