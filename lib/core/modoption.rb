#######################################################################
#                                                                     #
#  Option system                                                      #
#                                                                     #
#######################################################################

require 'json'

class ModOption

	@@options = Hash.new


	public

	def initialize(path)
		@@path = path
		begin
			fh = FileHandler.new(@@path+"/options.json")
			@@opt = JSON.parse(fh.getContent())
		rescue Exception => e
			@@opt = nil

		end
	end

	########################################################
	# Get options from module based on option file         #
	########################################################
	def showOptions()
		if defined? @@opt
			getOptions(@@opt)
		else
			# there is no option file on current path, maybe not a module path?
			puts "[-]".red + " No options available. Are you using a module?"
			
		end
	end

	def getOptionNames()
		if defined? @@opt
			ret = Array.new
			@@opt.each{|d| ret.push(d["name"])}

			return ret

		else
			return Array.new
		end
	end

	#########################################################
	# Set module option                                     #
	#########################################################
	def setOptions(option, value)
		@@opt[getIDByName(option)][:value] = value
		
		# write option file to save settings
		File.open(@@path+"/options.json", 'w') { |file| file.write(JSON.generate(@@opt)) }
	end


	def getIDByName(name)
		i = 0

		until !(defined? @@opt[i]["name"]) do 
			return i if @@opt[i]["name"] == name
			i += 1
		end


		return -1
	end

	def getOptionsByName(name)
		@@opt.each{|d| return d if d["name"] == name}
	end

	#########################################################
	# Get current option                                    #
	#########################################################
	def getCurrentOption(option)
		val = getOptionsByName(option)


		if defined? val["value"] and val["value"] != nil
			return val["value"].to_s
		elsif defined? val["default"] and val["default"] != nil
			return val["default"].to_s
		else
			return " "
		end
	end

	#########################################################
	# Check if all required settings are set 				# 
	#########################################################
	def requiredOptionsSet()
		@@opt.each{|d| return false if d["required"] == true and (d["value"] == nil or d["value"] == "")}

		return true
	end

	private

	#########################################################
	# Get module options based on json                      #
	#########################################################
	def getOptions(options)
		
		puts "Name".ljust(19) + "Description".ljust(19) + "Required".rjust(19) + "Current Value".rjust(19)

		@@opt.each{|d| puts d["name"].ljust(19) + d["description"].ljust(19) + d["required"].to_s.rjust(15) + getCurrentOption(d["name"]).rjust(22)}
	end	

	





end


