#######################################################################
#                                                                     #
#  Text completion                                                    #
#                                                                     #
#######################################################################

class TxtCompletion

	public

	def self.getMainCmd()
		return Core.getCoreCmd().map{|cmd| cmd.sub(Core.getCoreDir(), "")}
	end

	def self.getCmdSpecifiyComp(cmd)
		begin
			load Core.getCoreDir()+"/#{cmd}/comp.rb"
			return getComp().map {|d| d = "#{cmd} #{d}"}
		rescue Exception => e
			return []
		end
	end

	def self.getComps()
		ret = self.getMainCmd().sort()

		self.getMainCmd().each{|cmd| ret = (ret << self.getCmdSpecifiyComp(cmd).sort()).flatten!}

		return ret
	end

end


