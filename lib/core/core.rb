#######################################################################
#                                                                     #
#  Core commands information                                          #
#                                                                     #
#######################################################################

class Core
	@@baseDir = ""

	def self.setBaseDir(dir)
		@@baseDir = dir 
	end

	def self.getBaseDir()
		return @@baseDir
	end

	####################################################
	# Returns sys_cmd dir                              #
	####################################################
	def self.getCoreDir()
		return @@baseDir+"/sys_cmd/"
	end

	####################################################
	# Returns sys commands                             #
	####################################################
	def self.getCoreCmd()
		dirs = Dir.glob(self.getCoreDir()+"*").select {|f| File.directory? f}

		return dirs
	end

	####################################################
	# checks whether command exists                    #
	####################################################
	def self.existsCMD?(cmd)
		return File.directory?(self.getCoreDir() + cmd)
	end
end

