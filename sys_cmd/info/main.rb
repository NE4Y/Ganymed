#######################################################################
#                                                                     #
#  Show usage of module                                               #
#                                                                     #
#######################################################################
class Usage

	####################################################
	# Get module description                           #
	####################################################
	def self.getDescr(param)
		if param == []
			if Terminal.getPath() != ""
				return Module.getDescr(Module.getModDir() + Terminal.getPath())
			else
				return "[-]".red + " Sorry, i need an argument."
			end
		elsif Module.existsMod?(param[0])
			begin
				fh = FileHandler.new(Module.getModDir()  + param[0] + "/usage.txt")
				return fh.getContent()
			rescue Exception => e
				return "Sorry, someone seems to be lazy. There are no more information."
			end
		elsif not Core.existsCMD?(param[0])
			return "[-]".red + " Argument is not a valid command"
		else			
			begin
				fh = FileHandler.new(Core.getCoreDir() + "/" + param[0] + "/usage.txt")
				return fh.getContent()
			rescue Exception => e
				return "Sorry, someone seems to be lazy. There are no more information."
			end
		end
	end
end


def run(param)
	print Usage.getDescr(param)
end