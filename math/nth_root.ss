(define tolerance 0.000000001)

(define (power base exp)
	(if (= exp 1)
		base
		(* base (power base (- exp 1) ) )
	)
)

(define (done? guess)
	(< guess tolerance)
)

(define (one-over x)
	(/ 1 x)
)

(define (delta-n x n guess)
	(* (- (/ x (power guess (- n 1) ) ) guess ) (one-over n) )
)

(define (next-iter x n guess)
	(+ guess (delta-n x n guess) )
)

(define (nth-root-alg x n guess)
	(if (done? (abs (- (power guess n) x) ) )
		guess
		(nth-root-alg x n (next-iter x n guess) )
	)
)

(define (nth-root x n)
	(if (< x 0)
	"Error:Cannot take root of negative number"
	(nth-root-alg x n 1)
	)
)

