#######################################################################
#                                                                     #
#  Use command                                                        #
#                                                                     #
#######################################################################
class Use

	public 
	def initialize(mod)
		@mod = mod

		Terminal.setPath(@mod)
	end

end


def run(param)
	if Module.existsMod?(param[0])
		t = Use.new(param[0])
	elsif Module.existsMod?(Terminal.getPath + "/" + param[0])
		t = Use.new(Terminal.getPath + "/" + param[0])
	else
		puts "[-]".red + " Module doesn't exist."
	end
end