(loop for i upto 999
     when (or
	   (= (mod i 3) 0)
	   (= (mod i 5) 0))
     sum i)