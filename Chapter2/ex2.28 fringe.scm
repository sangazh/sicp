; Exercise 2.28

(define x (list (list 1 2) (list 3 4)))

(define (fringe tree)
	(cond ((null? tree) nil)
		  ((pair? (car tree)) (append (fringe (car tree)) (fringe (cdr tree))))
		  (else (append (list (car tree)) (fringe (cdr tree))))
	)
)

(fringe x)
(fringe (list x x))

