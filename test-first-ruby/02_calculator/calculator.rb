def add(a, b)
	a + b
end

def subtract(a, b)
	a - b
end

def sum(arr)
	suma = 0
	arr.each { | br | suma += br }
	suma
end

def multiply(arr)
	pr = 1
	arr.each { | br | pr *= br}
	pr
end

def power(a, b)
	a ** b
end

def factorial(n)
	f = 1
	if n == 0 || n == 1
		f
	else
		(1..n).each { | br | f *= br }
	end
	f
end