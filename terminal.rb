#######################################################################
#                                                                     #
# Terminal class, main user interface                                 #
#                                                                     #
#######################################################################
require 'colorize'
require 'readline'

# require all core libs
Dir[File.dirname(__FILE__) + '/lib/core/*.rb'].each {|file| require file }

class Terminal
	@@path = ""

	public

	def initialize(dir)
		Core.setBaseDir(dir)

		@@completions = TxtCompletion.getComps()
	end

	####################################################
	# Start ganymed                                    #
	####################################################
	def startGanymed()
		printBanner()
		startConsole()
	end

	private

	####################################################
	# Prints welcome banner                            #
	####################################################
	def printBanner()
		puts ""
		puts Banner.getBanner()
		puts "http://www.ne4y-dev.de"
		puts ""
		puts Module.getVersion()
		puts ""
	end

	####################################################
	# Returns displaying path                          #
	####################################################
	def getPath()
		@@path.empty? ? (path = "gnm > ".green) : (path = "gnm".green + " (#{@@path})".blue + " > ".green)
		return path
	end

	####################################################
	# Starts user interaction                          #
	####################################################
	def startConsole()

		# test for text completion 
		comp = proc { |s| @@completions.grep(/^#{Regexp.escape(s)}/) }

		Readline.completion_append_character = " "
		Readline.completer_word_break_characters = ""
		Readline.completion_proc = comp

		
		while line = Readline.readline(getPath(), true)
			cParser = CommandParser.new(line)
			cParser.execute()
			
			@@completions = TxtCompletion.getComps()

			comp = proc { |s| @@completions.grep(/^#{Regexp.escape(s)}/) }
			Readline.completion_proc = comp
			
			puts ""
			
		end
	end

	####################################################
	# Get path                                         #
	####################################################
	def self.getPath()
		return @@path
	end

	####################################################
	# Set path                                         #
	####################################################
	def self.setPath(path)
		@@path = path
	end
end


