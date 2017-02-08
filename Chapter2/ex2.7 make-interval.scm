; Exercise 2.7
; depends on 2.1.4
(define (make-interval a b)
	(cons a b))

(define (lower-bound interval)
	(if (< (car interval) (cdr interval))
	    (car interval)
	    (cdr interval)))

(define (upper-bound interval)
	(if (> (car interval) (cdr interval))
	    (car interval)
	    (cdr interval)))

(define a (make-interval 6.12 7.48))
(define b (make-interval 4.935 4.465))
(add-interval a b)
(mul-interval a b)