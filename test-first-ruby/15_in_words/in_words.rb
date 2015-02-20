require 'enumerator'	# za each_slice

module InWords
	def in_words
		ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]	# nil radi citljivije funkcije
		teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
		tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
		
		number = self	
		if number.between?(0, 9)
			ones[number]
		elsif number.between?(10,19)
			teens[number - 10]	
		else
			arrnum = []
			# sljedeca metoda uradi ovo: prije each slice, broj npr 1234567 razdvoji na ["7", "6", "5" ... "1"],
			# i onda ih slicea po troje, pa bude [["7", "6", "5"], ["4", "3", "2"], ["1"]] i onda spoji stringove
			# i nastane "765", "432", "1" u each_slice bloku i samo to reversa i stavi u arrnum. sminka, a?
			number.to_s.reverse.split('').each_slice(3) do | d |	
				num = d.join.reverse
				if num.length == 2
					num = "0" + num
				elsif num.length == 1
					num = "00" + num
				end
				arrnum << num
			end
			arrnum.reverse!	# posto ce biti ["567", "234", "1"], samo da reversam pa da ide ["1", "234", "567"]
			order = defineOrder arrnum
			out = []
			(0..arrnum.length - 1).each do | i |  	
				out << stringifyThreeDigits(arrnum[i]) 
				out << order[i] if arrnum.length >= 2 and not order[i].nil? and not out.last.nil?
			end 
			puts "AAAAAAAAa #{out}"
			out.compact.join(" ")	# compact brise nil-ove iz arraya
		end
	end

	def stringifyThreeDigits digits 	# digits je string!
		ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]	# nil radi citljivije funkcije
		teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
		tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
		
		out = []	# array je da ne brinem o spejsovima, pa na kraju join
		out << ones[digits[0].to_i] + " hundred" if digits[0].to_i != 0
		if digits[1].to_i == 1
			out << teens[digits[2].to_i]	# 11, 12..19
		elsif digits[1].to_i == 0
			out << ones[digits[2].to_i]	if digits[2].to_i != 0	# 01, 02, 03..09
		else
			out << tens[digits[1].to_i - 2]
			out << ones[digits[2].to_i] if digits[2].to_i != 0
		end
		out.join(" ") == '' ? nil : out.join(" ")
	end

	def defineOrder arrnum 
		order = ["thousand", "million", "billion", "trillion"]
		order[0..arrnum.length-2].reverse
	end
end

class Fixnum
	include InWords
end

class Bignum
	include InWords
end