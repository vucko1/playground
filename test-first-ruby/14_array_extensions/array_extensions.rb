class Array
	def sum
		sum = 0
		self.each { | n | sum += n}
		sum
	end

	def square
		arr = []
		self.each { | n | arr << n ** 2 }
		arr
	end

	def square!
		self.map! { | n | n = n ** 2 }
	end
end