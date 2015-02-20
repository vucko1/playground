class OrangeTree
	attr_reader :age
	attr_reader :height
	attr_reader :oranges_eaten

	def initialize age, height
		@age = age
		@height = height
		@condition = "alive"
		@oranges = 0
		@oranges_eaten = 0
	end

	def one_year_passes
		if @condition == "alive"
			@age += 1
			@height += 2
			@condition = "dead" if @age == 80
			@oranges += 5 if @age >= 2
		end
	end

	def tree_condition
		@condition
	end

	def num_oranges
		@oranges
	end

	def eat_orange n
		if @oranges - n <= 0
			"you can't eat an orange that isn't there.  There are 0 oranges available to eat"
		else
			@oranges -= n
			@oranges_eaten += n
		end
	end
end