#######################################################################
#                                                                     #
# System starter                                                      #
#                                                                     #
#######################################################################
require_relative 'terminal'
terminal = Terminal.new(__dir__)


begin
	terminal.startGanymed()
rescue Exception => e
	puts "Thanks for using Ganymed. Keep it up!"
	exit
end
