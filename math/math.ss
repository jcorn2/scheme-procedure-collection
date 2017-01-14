;A very VERY simple way to calculate x^exponent
;Only works with positive whole numbers
(define (power x exponent)
  (if (= exponent 1)
    x
    (* x (power x (- exponent 1)))))
