;A very VERY simple way to calculate x^exponent
;Only works with positive whole numbers
(define (power x exponent)
  (if (= exponent 1)
    x
    (* x (power x (- exponent 1)))))

;Get the square of x
(define (square x)
  (* x x))

;Get the absolute value of x
(define (abs x)
  (if (< x 0)
    (- x)
    x))

;Reciprocal of x
(define (recip x)
  (/ 1 x))
