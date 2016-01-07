#######################################################################
#                                                                     #
#  Show module                                                        #
#                                                                     #
#######################################################################

class Show
	@@modDir = Module.getModDir()

	public

	def initialize(type)
		@type = type
	end

	####################################################
	# Parse command                                    #
	####################################################
	def parseCommand()
		if @type.kind_of?(Array)
			if @type == [] and Terminal.getPath != ""
				if Module.existsMod?(Terminal.getPath)
					showModules(@@modDir + Terminal.getPath + "/")
				end
			elsif @type == []
				puts '[-]'.red + " Sorry, i need an argument"
			elsif @type[0] == "modules"
				showModules(@@modDir)
			elsif @type[0] == "options"
				mo = ModOption.new(Module.getModDir() + Terminal.getPath)
				mo.showOptions()
			else
				if Module.existsMod?(@type[0])
					showSpecificModule(@type[0])
				else
					puts '[-]'.red + " Module doesn't exist. Type 'show modules' to see all modules."
				end
			end
		else
			puts '[-]'.red + " Sorry, i need an argument"
		end
	end

	private

	####################################################
	# Show modules                                     #
	####################################################
	def showModules(dir)
		dirs = Dir.glob(dir+"*").select {|f| File.directory? f}

		puts "All modules, type 'use [module]'' to navigate"
		puts "==========================================="
		puts ""

		dirs.sort!.each{|d| puts d.sub(dir, "").ljust(29) + Module.getDescr(d).rjust(10)}
	end

	####################################################
	# Show specific modules                            #
	####################################################
	def showSpecificModule(param)
		dirs = Dir.glob(@@modDir+"/#{param}/*").select {|f| File.directory? f}

		puts param.capitalize + " module"
		puts "================="
		puts ""
		dirs.sort!.each{|d| puts d.sub(@@modDir+"/#{param}/", "").ljust(19) + Module.getDescr(d).rjust(10)}
	end

end


def run(param)
	s = Show.new(param)
	s.parseCommand()
end





