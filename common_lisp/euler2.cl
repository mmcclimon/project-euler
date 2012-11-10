(defun euler2 ()
  (loop
       for x = 0 then y
       and y = 1 then (+ x y)
       until (> y 4e6)
       when (evenp y)
       sum y))
