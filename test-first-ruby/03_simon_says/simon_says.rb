def echo(s)
	s
end

def shout(s)
	s.upcase
end

def repeat(s, n=2)
	e = []
	(1..n).each { | i | e << s }
	e.join(' ')
end

def start_of_word(s, n)
	s[0..n-1]
end

def first_word(s)
	s.split(' ')[0]
end

def titleize(s)
	arr = s.split(' ')
	arr[0] = arr[0].capitalize
	(1..arr.length - 1).each do | i | 
		if arr[i] != "and" and arr[i] != "over" and arr[i] != "the"
			arr[i] = arr[i].capitalize 
		end
	end
	arr.join(' ')
end
