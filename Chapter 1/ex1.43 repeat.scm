; Exercise 1.43
; depends on 1.42 compose
(define (repeat f n)
	(compose f (lambda (x) (f x)))
)

((repeat square 2) 5)

;Value: 625