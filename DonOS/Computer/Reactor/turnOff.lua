print("Reactor Off")
os.loadAPI("DonOS/Ref/DonWrapList")
os.loadAPI("DonOS/Helpers/DonWrap")
br = DonWrap.wrap(DonWrapList.reactor)

br.setActive(false)