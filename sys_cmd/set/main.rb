#######################################################################
#                                                                     #
#  Use command                                                        #
#                                                                     #
#######################################################################
class Set

	public 
	def initialize(mod)
		@mod = mod
	end

end


def run(param)
	if Module.existsMod?(Terminal.getPath())
		mo = ModOption.new(Module.getModDir() + Terminal.getPath)
		mo.setOptions(param[0], param[1])
		
	else
		puts "[-]".red + " No module selected."
	end
end