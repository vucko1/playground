class Dictionary
	def initialize
		@hash = {}
	end

	def entries
		@hash
	end

	def add hashentry
		if hashentry.class == String
			@hash[hashentry] = nil
		else
			@hash[hashentry.keys.first] = hashentry.values.first
		end
	end

	def keywords
		@hash.keys
	end

	def include? key
		@hash.has_key? key
	end

	def find arg
		newhash = {}
		@hash.keys.each do | key |
			if key =~ /^#{arg}/
				newhash[key] = @hash[key]
			end
		end
		newhash
	end

	def keywords
		@hash.keys.sort
	end

	def printable
		output = []
		self.keywords.each do | key |
			output.push %Q{[#{key}] "#{@hash[key]}"}
		end
		s = output.join("\n")
		puts s
		s
	end
end