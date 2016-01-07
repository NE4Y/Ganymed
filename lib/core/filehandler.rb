#######################################################################
#                                                                     #
#  FileHandler                                                        #
#                                                                     #
#######################################################################

class FileHandler

	public

	####################################################
	# Init file handler                                #
	# @filePath           filepath                     #
	####################################################
	def initialize(filePath)
		@fp = filePath
	end


	####################################################
	# Returns file content                             #
	####################################################
	def getContent()
		file = File.open(@fp, "r")
		content = file.read()

		file.close()

		return content
	end
end