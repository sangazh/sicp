; Exercise 2.22

; first one
(define (square-list-1 items)
	(define (iter things answer)
	    (if (null? things)
	        answer
	        (iter (cdr things)
	        	  (cons (square (car things)) answer)
	        )))
	(iter items nil)
)

(square-list-1 (list 1 3 4 5))

; second one
(define (square-list-2 items)
	(define (iter things answer)
		(if (null? things)
		    answer
			(iter (cdr things)
			  	  (cons answer
			            (square (car things)))))
		)
	(iter items nil)
)

(square-list-2 (list 1 3 4 5))
; ((((() . 1) . 9) . 16) . 25)

; correct
(define (square-list-3 items)
	(define (iter things answer)
		(if (null? things)
		    answer
			(iter (cdr things)
			  	  (append answer
			            (list (square (car things))))))
	)
	(iter items nil)
)

(square-list-3 (list 1 3 4 5))