def measure n=1
	t_total = 0
	n.times do
		t_start = Time.now				# pocetno vrijeme
		yield
		t_total += (Time.now - t_start) # krajnje
	end
	t_total /= n 	# posto vraca average a ne ukupno
end