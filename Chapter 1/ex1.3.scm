;Exercise 1.3
(define (max-two-square a b c)
	(if (= (max a b) (max b c))
		(sum-of-square (max a c) b)
		(sum-of-square (max b c) (max a b))
	)
)


(define (max a b)
	(if (> a b) a b)
)

(define (square x) (* x x))

(define (sum-of-square a b)
	(+ (square a) (square b))
)
