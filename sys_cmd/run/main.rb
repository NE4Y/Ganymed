def run(param)
	load Module.getModDir() + Terminal.getPath() + "/main.rb"
	mo = ModOption.new(Module.getModDir() + Terminal.getPath)
	if mo.requiredOptionsSet()
		runScript(param)
	else
		puts "[info]".yellow + " Not all required options are set."
	end
end