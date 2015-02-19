class RPNCalculator
	def initialize
		@stack = [0]		# nije stek ali se ponasao kao stek
	end

	def push arg
		@stack.push arg
	end

	def pop 
		@stack.pop()
	end

	def plus
		self.checkSize
		@stack.push(@stack.pop() + @stack.pop())
	end

	def minus
		self.checkSize
		@stack.push(- @stack.pop() + @stack.pop())
	end

	def divide
		self.checkSize
		@stack.push((1 / @stack.pop().to_f) * @stack.pop().to_f)
	end

	def times
		self.checkSize
		@stack.push(@stack.pop() * @stack.pop())
	end

	def value
		@stack.last
	end

	def checkSize
		if @stack.length == 1 and @stack[0] == 0
			raise "calculator is empty"
		end
	end

	def tokens s
		operators = ["+", "-", "*", "/"]
		s.split.map { | w | ((operators.include? w) ? w.to_sym : w.to_i) }
	end

	def evaluate s 
		operators = ["+", "-", "*", "/"]
		s.split.each do | w |
			if not operators.include? w
				self.push(w.to_i)
			elsif w == "+"
				self.plus
			elsif w == "-"
				self.minus
			elsif w == "*"
				self.times
			elsif w == "/"
				self.divide
			end
		end
		self.value
	end
end