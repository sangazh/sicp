; Exercise 2.7
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