def getComp()
	if Module.existsMod?(Terminal.getPath())
		mo = ModOption.new(Module.getModDir() + Terminal.getPath())
		return mo.getOptionNames()
	else
		return Array.new
	end
end