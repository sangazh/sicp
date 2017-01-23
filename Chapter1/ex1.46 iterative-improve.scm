; Exercise 1.46
(define (iterative-improve good-enough? improve)
	(define (iter guess)
		(let ((next (improve guess)))
			(if (good-enough? guess next)
			    next
			    (iter (improve next))))
	)
	iter)

; fix-point
(define (fixed-point f first-guess)
	((iterative-improve (lambda (v1 v2) (< (abs (- v1 v2)) tolerance))
						(lambda (guess) (f guess))
	)
	first-guess)
)
;
(golden-ratio 10)

;Value: 1.6180364726455159

; sqrt

(define (sqrt x)
	((iterative-improve (lambda (v1 v2) (< (abs (- v1 v2)) tolerance))
						(lambda (k) (average k (/ x k))))
	1.0)
)

(sqrt 4)

;Value: 2.000000000000002
