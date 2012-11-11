(defun biggest-palindrome-product (low-limit high-limit)
  (defun palindromep (num)
    (equal (write-to-string num) (reverse (write-to-string num))))
  (loop for i from low-limit to high-limit maximizing
       (loop for j from low-limit to high-limit
	    if (palindromep (* i j)) maximize (* i j))))

(defun euler4 ()
  (biggest-palindrome-product 100 999))
