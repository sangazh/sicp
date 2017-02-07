; Exercise 2.10 span-zero?
(define (span-zero? interval)
	(or (= 0 (upper-bound interval)) (= 0 (lower-bound interval)))
)

(define (div-interval x y)
	(if (span-zero? y)
	    (error "Error: The second argument's lower-bound or upper-bound spans zero!")
	    (mul-interval x (make-interval (/ 1.0 (upper-bound y))
								   (/ 1.0 (lower-bound y))))
	))

(define c (make-interval 4.935 0))
(define d (make-interval 0 4.21))
(div-interval a c)
(div-interval a d)
(div-interval c a)
