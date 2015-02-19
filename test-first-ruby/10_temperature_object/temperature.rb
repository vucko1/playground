class Temperature
	def initialize degrees
		@deg_c = degrees[:c] || (degrees[:f] - 32.0) * (5.0/9.0)	# cuvam u stepenima celzijevim
	end

	def in_fahrenheit
		@deg_c * (9.0/5.0) + 32
	end

	def in_celsius
		@deg_c
	end

	def self.from_celsius degrees_c
		new(:c => degrees_c) 	# vracam novi objekat kroz konstruktor
	end

	def self.from_fahrenheit degrees_f
		new(:f => degrees_f)
	end

	def ftoc(f)
  		(f - 32.0) * (5.0/9.0)
	end

	def ctof(c)
	  c * (9.0/5.0) + 32
	end
end

class Celsius < Temperature
	def initialize degrees_c
		super(:c => degrees_c)
	end
end

class Fahrenheit < Temperature
	def initialize degrees_f
		super(:f => degrees_f)
	end
end