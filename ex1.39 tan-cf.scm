;Exercise 1.39
; similar to 1.37
; iterative
(define (tan-cf x k)
	(define (tan-inter x k result)
		(let ((next-result (/ (square x) (- (- (* 2 k) 1) result))))
			(if (= k 1)
			    (/ x (- 1 result))
			    (tan-inter x (- k 1) next-result))
			)
	  )
	(exact->inexact (tan-inter x k 0))
)

(tan-cf 3.14 1000)