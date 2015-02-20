class XmlDocument
	def initialize(indent=false)
		@indent = indent
		@ind_level = 0	# za spejsove
	end

	def method_missing(method_name, *args, &block)
		arg = args[0] || {}		# arg == {} ako je npr metoda: .hello, a .hello(...) će biti arg[0]
		out = ""
		out = ("  " * @ind_level) if @indent
		out += "<#{method_name}"
		if arg != {}
			out += " #{arg.keys[0]}='#{arg.values[0]}'"
		end
		if block	# ako je <xyz> ... </xyz>
			out += ">"
			out += "\n"	if @indent
			@ind_level += 1
			out += yield
			@ind_level -= 1
			out += ("  " * @ind_level) if @indent
			out += "</#{method_name}>"
			out += "\n" if @indent
		else	# ako je <xyz/>
			out += "/>"
			out += "\n" if @indent
		end
		out
	end
end