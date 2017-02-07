; Exercise 2.20
(define nil (list))

(define (parity-of x)
	(if (even? x)
	    2
	    1))

(define (same-parity a . z)
	(define (find lst parity)
		(if (null? lst)
		    nil
		    (if (= parity (parity-of (car lst)))
		    	(cons (car lst) (find (cdr lst) parity))
		    	(find (cdr lst) parity))))

	(if (null? z)
	    a
	    (cons a (find z (parity-of a))))
)

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)