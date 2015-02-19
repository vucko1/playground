def reverser 
	(yield.split(' ').map { | w | w.reverse! }).join(' ')
end

def adder n = 1
	yield + n
end

def repeater n = 1
	(1..n).each do | i |	# ovdje moze n.times do yield end
		yield
	end
end