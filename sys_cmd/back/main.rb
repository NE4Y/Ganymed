#######################################################################
#                                                                     #
#  Back command                                                       #
#                                                                     #
#######################################################################

class Back

	public

	####################################################
	# Returns new path                                 #
	####################################################
	def self.getPath()
		path = Terminal.getPath()

		if path != ""
			s = path.split("/")
			s.pop()

			if s == []
				return ""
			else
				return s[0]
			end
		else
			return ""
		end
	end
end

def run(param)
	t = Terminal.setPath(Back.getPath())
end