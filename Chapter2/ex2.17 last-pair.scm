; Exercise 2.17

(define (last-pair items)
	(let ((last-ref (- (length items) 1)))
		(list-ref items last-ref))
	)

; recursive way

(define (last-pair items)
	(if (null? (cdr items))
	    items
	    (last-pair (cdr items))))

(last-pair (list 23 72 149 34))