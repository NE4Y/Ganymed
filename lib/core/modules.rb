#######################################################################
#                                                                     #
#  Module informations                                                #
#                                                                     #
#######################################################################

class Module	

	####################################################
	# Returns module dir                               #
	####################################################
	def self.getModDir()
		return Core.getBaseDir()+"/modules/"
	end

	####################################################
	# Returns Ganymed version                          #
	####################################################
	def self.getVersion()
		return "[" + "Ganymed v1.0".red + " - DevState]"
	end

	####################################################
	# Returns module description                       #
	####################################################
	def self.getDescr(mod)
		begin
			fh = FileHandler.new(mod + "/desc.txt")
			return fh.getContent()
		rescue Exception => e
			return "-----"
		end
	end		

	####################################################
	# checks whether module exists                     #
	####################################################
	def self.existsMod?(mod)
		return File.directory?(self.getModDir() + mod)
	end

	####################################################
	# Returns modules                                  #
	####################################################
	def self.getModules()
		dirs = Dir.glob(self.getModDir()+"*").select {|f| File.directory? f}

		return dirs
	end

	####################################################
	# Returns all modules                              #
	####################################################
	def self.getAllModules()
		dirs = Dir.glob(self.getModDir()+"**/*").select {|f| File.directory? f}

		return dirs
	end


end