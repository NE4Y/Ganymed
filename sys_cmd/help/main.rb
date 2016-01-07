#######################################################################
#                                                                     #
#  Help module                                                        #
#                                                                     #
#######################################################################

def run(param)

	puts "Core Commands"
	puts "==============="

	Core.getCoreCmd().sort!.each {|dir| puts dir.sub(Core.getCoreDir(), "").ljust(19) + Module.getDescr(dir).rjust(10)}
end

