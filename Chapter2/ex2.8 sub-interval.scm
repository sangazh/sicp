; Exercise 2.8
; depends on ex2.7 and 2.1.4
; ref: https://en.wikipedia.org/wiki/Interval_arithmetic
(define (sub-interval x y)
	(make-interval (- (lower-bound x) (upper-bound y))
				   (- (upper-bound x) (lower-bound y))))

(sub-interval a b)