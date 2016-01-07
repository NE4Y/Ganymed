#######################################################################
#                                                                     #
#  Portscanner                                                        #
#                                                                     #
#######################################################################

require 'socket'
require 'ipaddress'
require 'timeout'

class PortScanner
	

	public
	def open_port(host, startport, endport, max)
		

		until startport == endport or startport > max do
			sock = Socket.new(:INET, :STREAM)
			raw = Socket.sockaddr_in(startport, host)
			begin
				if sock.connect(raw)
					puts "[open]".green + " Port #{startport}" 
				else
					#puts "[closed]".red + " Port #{startport}"
				end
				
			rescue Exception => e
				#puts "[closed]".red + " Port #{startport}"		
			end

			sock.close

			startport += 1
		end
		
	end
end

def runScript(param)
	mo = ModOption.new(Module.getModDir() + Terminal.getPath)
	if IPAddress.valid? mo.getCurrentOption("TARGET_HOST").to_s
		host = mo.getCurrentOption("TARGET_HOST").to_s
	else
		puts "[info]".yellow + " Retrieve IP for " + mo.getCurrentOption("TARGET_HOST").to_s
		puts "[info]".yellow + " Found IP: " + IPSocket::getaddress(mo.getCurrentOption("TARGET_HOST").to_s)
		host = IPSocket::getaddress(mo.getCurrentOption("TARGET_HOST").to_s)
	end

	startScan(host, mo.getCurrentOption("START_PORT").to_i, mo.getCurrentOption("END_PORT").to_i)
end

def startScan(host, start_port, end_port)
	puts "[info]".yellow + " Start port scan for #{host} from #{start_port} til #{end_port} - Only open ports are listed"
	ps = PortScanner.new()
	range = 3
	until start_port > end_port do
   		t = Thread.new{ps.open_port(host, start_port, start_port + range, end_port)}
   		t.abort_on_exception = true
   		t.join
   		start_port += range
	end
end


#run("127.0.0.1", 0, 631)