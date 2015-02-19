class Book
	attr_reader :title

	def title=(title)
		title.capitalize!
		arr = ["and", "the", "in", "of", "a", "an"]		
		t = title.split(' ')
		t.map do | w |
			if not arr.include?(w) 
				w.capitalize!
			end
		end
		@title = t.join(' ')
	end
end