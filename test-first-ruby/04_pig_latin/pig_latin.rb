def translate (s)
	arr = s.split(' ')
	vowels = ['a', 'e', 'i', 'o', 'u']
	(0..arr.length - 1).each do | i |
		if not vowels.include?(arr[i][0])
			br = 0
			j = 0
			while not vowels.include?(arr[i][j])
				if arr[i][j+1] == 'u'
					br += 1
					j += 1
				end
				br += 1
				j += 1
			end
			arr[i] = arr[i][br..arr[i].length] + arr[i][0..br - 1]		
		end	
		arr[i] += "ay"
	end
	arr.join(' ')
end

# zvanično rješenje sa regular expressionima!

# def translate (s)
#	s.split.map do | word | 
#		word =~ /^([^aeiouyq]*(qu)?)(.*)$/x
#		firstpart = $1
#		rest = $3
#		"#{rest}#{firstpart}ay"
#	end.join(" ")
#end