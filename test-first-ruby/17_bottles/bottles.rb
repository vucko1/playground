def bottles n, p=""
	if n == 0
		p += "No more bottles of beer on the wall.\n"
		return p
	else
		p += "#{n} bottle#{"s" if n > 1} of beer on the wall. #{n} bottle#{"s" if n > 1} of beer.\n"
	end
		
	p += "Take one down and pass it around.\n"
	p += "#{n - 1} bottle#{"s" if n > 2} of beer on the wall.\n" if n > 1
	return bottles(n - 1, p)
end

puts bottles(99)