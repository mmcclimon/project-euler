(defun prime-factors (number)
	   (defun primep (n)
	     (when (> n 1)
	       (loop for fac from 2 to (isqrt n)
		    never (zerop (mod n fac)))))
	   (defun first-prime-factor (num)
	     (loop for i in
		  (loop for z from 2 to (isqrt num)
		       when (primep z) collect z)
		  when (zerop (mod num i)) return i
		  finally (return nil)))
	   (loop
		for x = number then (/ x y)
		for y = (first-prime-factor x)
		until (not (numberp y))
		collect y into factors
		finally (return (append factors (list x)))))