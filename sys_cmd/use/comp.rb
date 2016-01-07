def getComp()
	return Module.getAllModules().each{|mod| mod.sub!(Module.getModDir(), "")}
end