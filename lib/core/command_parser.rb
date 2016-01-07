#######################################################################
#                                                                     #
#  Command parser Ganymed                                             #
#                                                                     #
#######################################################################

class CommandParser

	public

	####################################################
	# Init with command                                #
	####################################################
	def initialize(cmd)
		tmp = cmd.split(" ")
		@cmd = tmp[0]
		tmp.shift()
		@param = tmp
		@oldcmd = cmd
	end

	####################################################
	# Executes the command                             #
	####################################################
	def execute()
		if Core.existsCMD?(@cmd)
			begin
				load Core.getCoreDir()+@cmd+"/main.rb"
				run(@param)
			rescue SystemExit
				exit
			rescue Exception => e
				puts "[-]".red + " Error in module " + @cmd
				puts "[!]".yellow + " " + e.to_s
			end
		else
			puts "[-]".red + " Unknown Ganymed command"
			puts "[!]".yellow + " Executing system command"
			system @oldcmd
		end
	end

end