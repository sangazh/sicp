; Exercise 1.35
(define (golden-ratio x)
	(exact->inexact (fixed-point (lambda (y) (+ 1 (/ 1 y))) x))
)

(golden-ratio 10)

;Value: 1.6180364726455159