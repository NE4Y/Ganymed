
def getComp()
	return Core.getCoreCmd().map{|d| d.sub!(Core.getCoreDir(), "")}
end